function A = readblock(fout, sbtag, ebtag);
  wait_disp_thres = 0.1;  
  EAGAIN = errno ("EAGAIN");
  done = false;
  started = false;
  nwaits = 0;
  dispw = false;
  A = '';

fclear (fout);  % otherwise, fails on next call

  do
    s = fgets (fout);
    if (ischar (s))
      %fputs (stdout, s);
      if (started)
        A = [A s];
      end
      % if we see the end tag, we're done
      if (strncmp(s, sbtag, length(sbtag)))
        started = true;
      end
      % if we see the end tag, we're done
      if (strncmp(s, ebtag, length(ebtag)))
        done = true;
      end

    elseif (errno () == EAGAIN)
      wait = exp(nwaits/10)/1e4;
      if wait <= wait_disp_thres
        %fprintf(stdout, 'W'); % debugging, in general do nothing
      elseif (~dispw)
        fprintf(stdout, 'Waiting...')
        dispw = true;
      else
        fprintf(stdout, '.')
      end
      sleep (wait);
      fclear (fout);
      nwaits = nwaits + 1;
    else
      errno ()
      error ('oh snap, maybe python failure?')
    end
    %disp('paused'); pause
  until (done)

  if (dispw)
    fprintf(stdout, '\n')
  end
  %fclose (fout);
  %waitpid (pid);
