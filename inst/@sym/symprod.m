%% Copyright (C) 2014 Colin B. Macdonald
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
%% @deftypefn  {Function File} {@var{y} =} symprod (@var{f}, @var{n}, @var{a}, @var{b})
%% @deftypefnx {Function File} {@var{y} =} symprod (@var{f}, @var{n}, [@var{a}, @var{b}])
%% @deftypefnx {Function File} {@var{y} =} symprod (@var{f}, [@var{a}, @var{b}])
%% Symbolic product.
%%
%% FIXME: symprod(f, [a b]), other calling forms
%%
%% FIXME: revisit witn sympy 0.7.5:
%% @example
%% symprod(q,n,1,oo )
%% ans = [sym] q**oo
%% 0^oo
%% ans = [sym] 0
%% @end example
%%
%% @seealso{symsum, prod}
%% @end deftypefn

%% Author: Colin B. Macdonald
%% Keywords: symbolic

function S = symprod(f,n,a,b)

  % FIXME: symvar
  %if (nargin == 3)
  %  n = symvar

  cmd = [ '(f,n,a,b) = _ins\n'  ...
          'S = sp.product(f,(n,a,b))\n'  ...
          'return (S,)' ];
  S = python_cmd (cmd, sym(f), sym(n), sym(a), sym(b));

