% exercise 1: Rotating a cyclinder
%
% video: https://www.youtube.com/watch?v=jYkHTfPiGgI&index=9&list=PLf4UUw377fIfu61-yNb_2KHroMWny1hbd
% 
% task: Create an animation of a cylinder that rotate around the global y axis 


% create figure for cylinder to 'live' on and set a nice 3D view
%
figure;
view([180 90 90])
xlim([-10 10])
ylim([-10 10])
zlim([-10 10])
xlabel('X-axis')
ylabel('Y-axis')
zlabel('Z-axis')


% Create random cylinder surface then convert to patch object
%
R = 5;                    % radius of cylinder
N = 20;                   % number of vertices used to draw cylinder (larger N = more rounded)
[x,y,z] = cylinder(R,N);  % Matlab built-in function to create surfaces of cylinder
[vertices,faces] = surface2patch(x,y,z); % biomechZoo preferred object style
patch_handle = patch('vertices',vertices,'faces',faces,'faceColor',[1 0 0]);


% get rotation coordindates
%
ud.vert = vertices; 
set(patch_handle,'userdata',ud)

gunit = [1 0 0; 0 1 0; 0 0 1];
ijkStack = [];
for i = 1:10:360
    
    %rotate gunit by i degrees about the y axiis
    ijk = vecrotate(gunit,i,'y');
    
    % Stack ijk vectors as a cell array
    ijkStack = [ijkStack;{ijk}];
    
end

ud.ort = ijkStack;
set(patch_handle,'userdata',ud)


% rotate the cylidner
%
for i = 1:length(ijkStack)
    
    ort = ud.ort{i};
    vr = ud.vert;
    
    newVr = ctransform(ort,gunit,vr);
    
    set(patch_handle,'vertices',newVr)
    
    pause(0.1)
    
end
    


    

