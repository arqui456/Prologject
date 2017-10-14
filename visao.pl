matriz(
	[p,c,p,c,p,c,p,p,
	 p,c,c,c,c,c,c,c,
	 p,c,p,c,p,c,p,p,
	 p,c,c,c,p,c,c,c,
	 p,p,p,c,p,p,c,p,
	 p,c,c,c,c,c,c,c,
	 p,c,p,p,c,p,c,p,
	 p,c,c,c,c,c,c,c]).

pegar(PosX,PosY,Size,R):-
	R is PosX + (PosY * Size),
	PosX < Size,
	PosY < Size,
	PosX >= 0,
	PosY >= 0.
pegar(_,_,_,-1).

pegarUp(PosX,PosY,Size,R):- PosY1 is PosY-1, pegar(PosX,PosY1,Size,R).
pegarDown(PosX,PosY,Size,R):- PosY1 is PosY+1, pegar(PosX,PosY1,Size,R).
pegarLeft(PosX,PosY,Size,R):- PosX1 is PosX-1, pegar(PosX1,PosY,Size,R).
pegarRight(PosX,PosY,Size,R):- PosX1 is PosX+1, pegar(PosX1,PosY,Size,R).

info(-1,_,-1).
info(0,[],0).
info(0,[Head],Head).
info(0,[Head|_],Head).
info(Counter,[_|Tail],Rest):- NewCounter is Counter-1,info(NewCounter,Tail,Rest).
			    
adjacente(PosX,PosY,Size,R):-
			    matriz(Maze),
			    pegarUp(PosX,PosY,Size,Up),
			    info(Up,Maze,UpInfo),
			    pegarDown(PosX,PosY,Size,Down),
			    info(Down,Maze,DownInfo),
			    pegarLeft(PosX,PosY,Size,Left),
			    info(Left,Maze,LeftInfo),
			    pegarRight(PosX,PosY,Size,Right),
			    info(Right,Maze,RightInfo),
			    R = [UpInfo,RightInfo,DownInfo,LeftInfo],!.
