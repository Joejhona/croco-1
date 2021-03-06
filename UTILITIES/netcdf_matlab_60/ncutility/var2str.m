function s = Var2Str(x)

% VAR2STR String equivalent to a matrix.
%  VAR2STR(X) converts variable X to a one-line
%   string which is roughly equivalent
%   to X, for display purposes.  If X is
%   larger than a scalar, then its values are
%   written between square brackets.

% Copyright (C) 1991 Charles R. Denham, ZYDECO.
% All Rights Reserved.

if nargin < 1
   help Var2Str
   x = [1 2 3; pi inf nan];
   disp(' The matrix:'), disp(' ')
   disp(x), disp(' becomes the string:'), disp(' ')
   disp([' ' Var2Str(x)])
   return
end

if isempty(x)
   if isstr(x)
      s = '''''';
     else
      s = '[]';
   end
   return
end

quote = '''';

[m, n] = size(x);

s = '';
bracket = isstr(x) & m > 1 | ~isstr(x) & length(x) > 1;
if bracket, s = ['[']; end

for i = 1:m
   if isstr(x)
      t = [quote x(i, :) quote];
      s = [s t];
     else
      for j = 1:n
         z = x(i, j);
         if isnan(z)
            t = 'nan';
           elseif z == inf
            t = 'inf';
           elseif z == -inf
            t = '-inf';
           elseif z == fix(z)
            t = int2str(z);
           else
            t = num2str(z);
         end
         s = [s t];
         if j < n, s = [s ' ']; end
      end
   end
   if i < m, s = [s '; ']; end
end

if bracket, s = [s ']']; end
