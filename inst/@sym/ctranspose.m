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
%% @deftypefn  {Function File} {@var{y}} ctranspose (@var{x})
%% Conjugate (Hermitian) transpose of a symbolic array.
%%
%% @seealso{transpose}
%% @end deftypefn

%% Author: Colin B. Macdonald
%% Keywords: symbolic

function z = ctranspose(x)

  cmd = [ '(x,) = _ins\n'  ...
          'if x.is_Matrix:\n'  ...
          '    return ( x.H ,)\n' ...
          'else:\n' ...
          '    return ( x.conjugate() ,)' ];

  z = python_cmd (cmd, x);

