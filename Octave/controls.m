ind = 1:10
for i=ind,
  disp(i);
  end;

i = 1;
while i <= 5,
  v(i)=100;
  i = i+1;
end;
v

i = 1;
while true,
  v(i) = 999;
  i = i + 1;
  if i == 6,
    disp(i);
    break;
  end;
  if i > 100,
    disp('loop perventation')
    break;
  end;
end;

v(1)=1;

if v(1)==1,
  disp('The value is one');
  elseif v(1) == 2,
    disp('The value is two');
  else
    disp('else');
end;
