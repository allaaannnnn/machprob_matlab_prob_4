ho = input('Initial height: ');
vo = input('Initial velocity: ');
th = input('Angle in degrees: ');
ax = input('x-component acceleration: ');
ay = input('y-component acceleration: ');
pr = input('Precision(Time Interval): ');

if ay>=0
    disp('Positive or no vertical acceleration would result in no free fall. Aborting.')
    return
end

vox = vo*cosd(th);
voy = vo*sind(th);

tm = max(roots([(ay/2) voy ho]));
d = 0:pr:tm;    
x = zeros(1,length(d)+1);
y = zeros(1,length(d)+1);

t=pr;
x(1)=0;
y(1)=ho;

for i = 1:length(d)-1
    xt = (ax*(t^2))/2 + vox*t;
    yt = (ay*(t^2))/2 + voy*t + ho;
    x(i+1) = xt;
    y(i+1) = yt;
    t=t+pr;
end

x(length(d)+1)=(ax/2)*tm^2 + vox*tm;
y(length(d)+1)=0;

plot(x,y)
grid on
xlim([0 max(x)+1])
ylim([0 max(y)+1])
ylabel('Height')
xlabel('Distance')
