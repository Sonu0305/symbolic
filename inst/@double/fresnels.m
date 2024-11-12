%% SPDX-License-Identifier: GPL-3.0-or-later
%% Copyright (C) 2016-2022, 2024 Colin B. Macdonald
%%
%% This file is part of OctSymPy.
%%
%% OctSymPy is free software; you can redistribute it and/or modify
%% it under the terms of the GNU General Public License as published
%% by the Free Software Foundation; either version 3 of the License,
%% or (at your option) any later version.
%%
%% This software is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty
%% of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
%% the GNU General Public License for more details.
%%
%% You should have received a copy of the GNU General Public
%% License along with this software; see the file COPYING.
%% If not, see <http://www.gnu.org/licenses/>.

%% -*- texinfo -*-
%% @documentencoding UTF-8
%% @defun fresnels (@var{x})
%% Numerical fresnels function.
%%
%% Example:
%% @example
%% @group
%% fresnels (1.1)
%%   @result{} ans = 0.5365
%% @end group
%% @end example
%%
%% @strong{Note} this function may be slow for large numbers of inputs.
%% This is because it is not a native double-precision implementation
%% but rather the numerical evaluation of the Python @code{mpmath} function
%% @code{fresnels}.
%%
%% Note: this file is autogenerated: if you want to edit it, you might
%% want to make changes to 'generate_functions.py' instead.
%%
%% @seealso{@@sym/fresnels}
%% @end defun


function y = fresnels (x)
  if (nargin ~= 1)
    print_usage ();
  end
  cmd = { 'L = _ins[0]'
          'A = [complex(mpmath.fresnels(x)) for x in L]'
          'return A,' };
  c = pycall_sympy__ (cmd, num2cell (x(:)));
  y = reshape (cell2mat (c), size (x));
end


%!error fresnels (1, 2)

%!test
%! x = 1.1;
%! y = sym(11)/10;
%! A = fresnels (x);
%! B = double (fresnels (y));
%! assert (A, B, -4*eps);

%!test
%! y = [2 3 sym(pi); exp(sym(1)) 5 6];
%! x = double (y);
%! A = fresnels (x);
%! B = double (fresnels (y));
%! assert (A, B, -4*eps);

%!test
%! % maple:
%! % > A := [1+2*I, -2 + 5*I, 100, 10*I, -1e-4 + 1e-6*I, -20 + I];
%! % > for a in A do evalf(FresnelS(a)) end do;
%! x = [1+2i; -2+5i; 100; 10i; -1e-4 + 1e-6*1i; -20-1i];
%! A = [  36.725464883991438430 + 15.587751104404587334*1i
%!        0.12213736710980573217e13 - 0.47688568479924574726e12*1i
%!        0.49681690114783755327
%!       -0.46816997858488224040*1i
%!       -0.52344169596561937423e-12 + 0.15707439669173367248e-13*1i
%!        0.75738824160998910399e24 + 0.15391592966931193100e26*1i ];
%! B = fresnels (x);
%! assert (A, B, -eps)

%!assert (fresnels (inf), 0.5)
%!assert (fresnels (-inf), -0.5)
