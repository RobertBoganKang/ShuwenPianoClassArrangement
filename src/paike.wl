(* ::Package:: *)

(*Algorithm I: Purely Guess*)
(*Initialize*)
Clear["Global`*"];
dat=First[Import[NotebookDirectory[]<>"data.ods"]];
zeros=Table[0,{i,5},{j,9}];
zerosL=Table[{},{i,5},{j,9}];
xingqi={"\:4e00"->1,"\:4e8c"->2,"\:4e09"->3,"\:56db"->4,"\:4e94"->5};
data=SortBy[dat,-#[[2]]&];
(*data=Select[dat,#[[2]]!=0&];*)
names=Table[i->data[[i,1]],{i,Length@data}];names=Append[names,0->""];
(*Generate Candidate Tables*)
personalFrees=Table[dateSplt=StringSplit[data[[l,3]],{"\:3001","\:ff1b",";"}];
cpyzeros=zeros;
Do[strTake=StringTake[dateSplt[[k]],1]/.xingqi;
strDrop=StringDrop[dateSplt[[k]],1];
fillPrepare=StringSplit[#,"-"]&@StringSplit[strDrop,{",","\:ff0c"}];
candidate=Flatten[Table[temp=fillPrepare[[j]];If[Length[temp]!=1,Table[i,{i,ToExpression[temp[[1]]],ToExpression[temp[[2]]]}],ToExpression[temp]],{j,Length[fillPrepare]}]];
Table[cpyzeros[[strTake,candidate[[i]]]]=1,{i,Length[candidate]}];,{k,Length[dateSplt]}];cpyzeros,{l,Length@data}];
(*Exception Start*)
except[x_(*date,start,end*)]:=Do[personalFrees[[i,x[[1]],j]]=0,{i,Length@personalFrees},{j,x[[2]],x[[3]]}];
except/@{{4,1,9},{3,1,2},{5,5,9},{2,1,1},{5,1,1}};
(*Exception End*)
(*Show Result*)
(*MatrixPlot[Transpose@Total[personalFrees],Mesh\[Rule]All]
Transpose[Total[personalFrees]]//TableForm*)
personFree=personalFrees;
testTable=zeros+2;fillForm[]:=(finalTable=zerosL;length=0;Do[candidateChoice=Drop[ArrayRules[personFree[[i]]][[;;,1]],-1];
If[Length[candidateChoice]==0,Break,selectIt:=RandomChoice[candidateChoice];
temp=selectIt;
count=0;
selectNow[]:=If[testTable[[temp[[1]],temp[[2]]]]-(data[[i,2]]+1)>=0||count>1000,Return,count++;temp=selectIt;selectNow[]];
selectNow[];If[count>1000,Null,length++;testTable[[temp[[1]],temp[[2]]]]-=(data[[i,2]]+1);finalTable[[temp[[1]],temp[[2]]]]=Append[finalTable[[temp[[1]],temp[[2]]]],i];If[testTable[[temp[[1]],temp[[2]]]]==0,Do[personFree[[ii,temp[[1]],temp[[2]]]]=0,{ii,Length@personFree}]]]];,{i,Length@personFree}];);
length=0;
While[length<Length@data,personFree=personalFrees;testTable=zeros+2;fillForm[]]
(*Result*)
str[x_]:=If[Length[x]<=1,StringJoin[x],StringRiffle[x,"/"]];namespace=Transpose[finalTable/.names];
TableForm[Table[str[namespace[[i,j]]],{i,Length@namespace},{j,Length[namespace[[1]]]}],TableHeadings->{{1,2,3,4,5,6,7,8,9},xingqi[[;;,1]]},TableAlignments->Center]
Clear["Global`*"];


(*Algorithm II: Depth First Search*)
(*Initialize*)
Clear["Global`*"];
dat=First[Import[NotebookDirectory[]<>"data.ods"]];
zeros=Table[0,{i,5},{j,9}];
zerosL=Table[{},{i,5},{j,9}];
xingqi={"\:4e00"->1,"\:4e8c"->2,"\:4e09"->3,"\:56db"->4,"\:4e94"->5};
data=RandomSample[dat];
credit=data[[;;,2]];
names=Table[i->data[[i,1]],{i,Length@data}];names=Append[names,0->""];
(*Generate Candidate Tables*)
personalFrees=Table[dateSplt=StringSplit[data[[l,3]],{"\:3001","\:ff1b",";"}];
cpyzeros=zeros;
Do[strTake=StringTake[dateSplt[[k]],1]/.xingqi;
strDrop=StringDrop[dateSplt[[k]],1];
fillPrepare=StringSplit[#,"-"]&@StringSplit[strDrop,{",","\:ff0c"}];
candidate=Flatten[Table[temp=fillPrepare[[j]];If[Length[temp]!=1,Table[i,{i,ToExpression[temp[[1]]],ToExpression[temp[[2]]]}],ToExpression[temp]],{j,Length[fillPrepare]}]];
Table[cpyzeros[[strTake,candidate[[i]]]]=1,{i,Length[candidate]}];,{k,Length[dateSplt]}];cpyzeros,{l,Length@data}];
(*Exception Start*)
except[x_(*date,start,end*)]:=Do[personalFrees[[i,x[[1]],j]]=0,{i,Length@personalFrees},{j,x[[2]],x[[3]]}];
except/@{{4,1,9},{3,1,2},{5,5,9},{2,1,1},{5,1,1}};
(*Exception End*)
personFree=Table[Position[personalFrees[[i]],1],{i,Length[personalFrees]}];
personFree=RandomSample/@personFree;
lengths=Length/@personFree;
(*Sort*)
(*dataSort=Transpose@Drop[Transpose[SortBy[Transpose@Append[Append[Transpose[data],personFree],lengths],Last]],-1];
personFree=RandomSample/@(dataSort[[;;,4]]);
names=Table[i\[Rule]dataSort[[i,1]],{i,Length@data}];names=Append[names,0\[Rule]""];
lengths=Sort[lengths];
credit=dataSort[[;;,2]];*)
(*DFS*)
cpyzeros=zerosL;
test=True;
testTable=zeros+2;
DFSdata[layer_]:=(
lyer=layer;
If[test,
If[layer>Length[lengths],finalTable=cpyzeros;test=False;Return[]];
Do[
If[testTable[[personFree[[layer,i,1]],personFree[[layer,i,2]]]]-(credit[[layer]]+1)>=0,
testTable[[personFree[[layer,i,1]],personFree[[layer,i,2]]]]-=(credit[[layer]]+1);
AppendTo[cpyzeros[[personFree[[layer,i,1]],personFree[[layer,i,2]]]],layer];
DFSdata[layer+1];
cpyzeros[[personFree[[layer,i,1]], personFree[[layer,i,2]]]]=Drop[cpyzeros[[personFree[[layer,i,1]], personFree[[layer,i,2]]]],-1];
testTable[[personFree[[layer,i,1]],personFree[[layer,i,2]]]]+=(credit[[layer]]+1);
];
,{i,lengths[[layer]]}]]
);
(*Run*)
DFSdata[1];
(*Result*)
str[x_]:=If[Length[x]<=1,StringJoin[x],StringRiffle[x,"/"]];namespace=Transpose[finalTable/.names];
TableForm[Table[str[namespace[[i,j]]],{i,Length@namespace},{j,Length[namespace[[1]]]}],TableHeadings->{{1,2,3,4,5,6,7,8,9},xingqi[[;;,1]]},TableAlignments->Center]
Clear["Global`*"];

