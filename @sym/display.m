function display(obj)
  d = size(obj);

  %if (length(d) == 2) && (d(1) == 1) && (d(2) == 1)
  if (isscalar(obj))
    fprintf ('%s = [%s] ', inputname (1), class (obj));
    fprintf ('%s', obj.text);
    % trim newlines
    s = regexprep (obj.pickle, '\n', '\\n');
    len = length (s);
    if len < 100
      ellipsize = s;
    else
      ellipsize = ['…' s(1:100) '…'];
    end
    fprintf('  [%s]\n', ellipsize);

  elseif (length(d) == 2)
    %% 2D Array
    fprintf ('%s = [%s 2D array]\n', inputname (1), class (obj));
    [n,m] = size(obj);
    for i=1:n
      fprintf ('[')
      fprintf ('%s\t', obj(i,:).text)
      fprintf (']\n')
    end
  else
    %% nD Array: TODO: how do we want this displayed?
    fprintf ('%s = [%s nD array]\n', inputname (1), class (obj));
    disp(struct(obj))
  end