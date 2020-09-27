% Initialize matrix A and B
A = [1, 2, 4; 5, 3, 2]
B = [1, 3, 4; 1, 1, 1]

% Initialize constant s
s = 2

% See how element-wise addition works
add_AB = A + B

% See how element-wise subtraction works
sub_AB = A - B

% See how scalar multiplication works
mult_As = A * s

% Divide A by s
div_As = A / s

% What happens if we have a Matrix + scalar?
add_As = A + s

% scalar multiplication
% Matrix scalar multiplication
% axb * bxc = axc
% 3x2 * 2x1 = 3x1
[1,3;4,0;2,1]*[1;5]
A
C =[3,4;8,3;9,7]

A * C

# Matrix-Vector multiplication
% Initialize matrix A
A = [1, 2, 3; 4, 5, 6;7, 8, 9]

% Initialize vector v
v = [1; 1; 1]

% Multiply A * v
Av = A * v


# mapping to house sizes

houses = [1,2104 ; 1, 1416; 1, 1534; 1,825]
h = [-40; .25]
prices = houses * h   % The calculatio is equal to ( θ0 * 1 + θ1 * x)

h3 = [-40, 200, -150 ; 0.25, 0.1, 0.4]

prices3 = houses * h3

## Matrix Multiplication Properties
# - Non Commutive
% AB != BA
# - Identity Matrix
%  [1, 0; 0, 1]


% Initialize random matrices A and B
A = [1,2 ; 4,5]
B = [1,1 ; 0,2]

% Initialize a 2 by 2 identity matrix
I = eye(2)

% The above notation is the same as I = [1,0;0,1]

% What happens when we multiply I*A ?
IA = I*A

% How about A*I ?
AI = A*I

% Compute A*B
AB = A*B

% Is it equal to B*A?
BA = B*A

% Note that IA = AI but AB != BA
% ---
## Inverse and Transpose
# Inverse
% A * A^-1 = A^-1 * A = I

A = [ 3, 4 ; 2, 16]

A * inv(A) % ~ [1, 0; 0, 1]

I== eye(2)


# Transpose
A = [1,2,0 ; 3, 5, 9]
transpose(A)
A'


transpose([3,5,1])
[3, -5, 4] * [1;2;5]
3;-10;20
