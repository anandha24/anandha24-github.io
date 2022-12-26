% Hitung BMR
% A = 1 is laki, 2 is perempuan | B = Berat Ideal | X = BMR
bmr(A,B,X) :- X is (30-(A-1)*5)*B.

% Hitung Berat Ideal
% A = 1 is Upper, 2 is under | B = tinggi | X = Berat Ideal
iwk(1,X,1) :- X >= 160.

iwk(1,X,2) :- X < 160.

iwk(2,X,1) :- X >= 150.

iwk(2,X,2) :- X < 150.

iw(A,C,X) :- iwk(C,A,P), X is (90/100+1*(P-1))*(A-100).

% Hitung Energy

% A = tinggi, B = berat badan, C = Gender, D = Aktivitas, E = Tingkat Stress, F = Age
% O = Kategori tinggi, P = Berat Badan Ideal, Q = BMR, R = Aktivitas, S Faktor Usia, T = Faktor Stress, U = Standarisasi Badan

ener(A,B,C,D,E,X) :- X is (A+B)-C+D+E.

energy(A,B,C,D,E,F,X,Y) :- iw(A,C,P), bmr(C,P,Q), activity(D,Q,R), age(F,Q,S), stress(E,Q,T),body(A,B,C,U), ener(Q,R,S,T,U,Z), X is Z, diet(X,V), Y is V.

diet(A,1) :- A<1100.

diet(A,2) :- A<1300.

diet(A,3) :- A<1500.

diet(A,4) :- A<1700.

diet(A,5) :- A<1900.

diet(A,6) :- A<2100.

diet(A,7) :- A<2300.

diet(A,8) :- A<2500.

diet(A,9) :- A>2500.

% Hitung Faktor Aktivitas
% A = Kategori, B = BMR

activity(A,B,X) :- X is 10/100*A*B.

% Faktor Stress
stress(A,B,X) :- X is B*((12/10)+((A*1)/10)).

% Faktor Umur
age(A,B,X) :- agek(A,P), X is 0+(P-1)*5*B/100.
agek(X,1) :- X<40.
agek(X,2) :- X<60.
agek(X,3) :- X<70.
agek(X,4) :- X>=70.

% Standarisasi Badan

% A = Tinggi, B = Berat, C = Gender

% body(A,B,C,X) :- iw(A,8,C,P), Q ts B/P#100, bodyk(Q,O), x is (((O-1)420)-20)4B/100.
body(A,B,C,X) :- iw(A,B,C,P), Q is B/P*100, bodyk(Q,O), X is (((O-1)*20)-20)*B/100.
bodyk(X,3) :- X<90.

bodyk(X,2) :- X<110.

bodyk(X,1) :- X>=110.
