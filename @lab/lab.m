classdef lab
%declares lab object
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------
    properties
    %define lab properties (parameters) 
    %lab is a plane whose points identify a position [x,y]
    %x and y are double, but a grid (matrix) is built upon the lab whose coordinates are integers
    %objects are placed on the grid
        shape;       %(1) shape of the lab (string) (at the moment 'square' only)
        unit;        %(2) unit of measure of the lab (e.g. 'meter')
        size;        %(3) size of the lab (e.g. in meters) (at the moment side of 'square')
        out_pos;     %(4) code for position out of the lab [x,y]
        door_pos;    %(5) position of lab door [x,y]
        field;       %(6) matrix containing values representing lab integer-coordinates (grid)
        empty_field; %(7) lab surface (no object on field)
        obj4cd;      %(8) object of interest for the chid (attractive to explore) (e.g. toy)
        obj4cr;      %(9) object of interest for the caregiver (attractive to explore)
        obj4cd_n;    %(10) number of obj4cds
        obj4cr_n;    %(11) number of obj4crs
        obj4cd_pos;  %(12) positions of obj4cds (array of obj4cd_n positions)
        obj4cr_pos;  %(13) positions of obj4crs (array of obj4cr_n positions)
        obj4cd_mex;  %(14) max exploration of obj4cds (how many iterations of interest to child)
        obj4cr_mex;  %(15) max exploration of obj4crs (how many iterations of interest to caregiver)
        obj4cd_xint; %(16) max interval for re-exploring obj4cds (when they become inactive) (after how many iterations it becomes of interest again for child)
        obj4cr_xint; %(17) max interval for re-exploring obj4crs (when they become inactive) (after how many iterations it becomes of interest again for caregiver)
        obj4cd_xc;   %(18) exploration counter for obj4cds (array of obj4cd_n values) (initialized to obj4cd_mex)
        obj4cr_xc;   %(19) exploration counter for obj4crs (array of obj4cr_n values) (initialized to obj4cr_mex)
        obj4cd_xic;  %(20) exploration interval counter for obj4cds (array of obj4cd_n values) (initialized to obj4cd_xint)
        obj4cr_xic;  %(21) exploration interval counter for obj4crs (array of obj4cr_n values) (initialized to obj4cr_xint)
        obj4cd_act;  %(22) activation of obj4cds (array of obj4cd_n flags) (true: active; false inactive) (active: of interest to child)
        obj4cr_act;  %(23) activation of obj4crs (array of obj4cd_n flags) (true: active; false inactive) (active: of interest to caregiver)
        cd_pos;      %(24) child position 
        cr_pos;      %(25) caregiver position 
        cd_cr_d;     %(26) child-caregiver lab distance
    end
    methods
        
    %this class definition mfile contains only the constructor method
    %all other methods are included as separate mfiles in the @lab folder 
    
        function lb=lab(varargin)
        %constructor method for lab  - assigns values to lab properties
        %lb=caregiver(...)
        switch nargin   
            %Use switch statement with nargin,varargin contructs to overload constructor methods
                case 0 
                %create default object
                    lb.shape       = [];
                    lb.unit        = [];
                    lb.size        = [];        
                    lb.out_pos     = [];
                    lb.door_pos    = [];
                    lb.field       = []; 
                    lb.empty_field = [];
                    lb.obj4cd      = [];
                    lb.obj4cr      = [];
                    lb.obj4cd_n    = [];         
                    lb.obj4cr_n    = [];  
                    lb.obj4cd_pos  = [];
                    lb.obj4cr_pos  = [];
                    lb.obj4cd_mex  = [];
                    lb.obj4cr_mex  = [];
                    lb.obj4cd_xint = [];
                    lb.obj4cr_xint = [];
                    lb.obj4cd_xc   = [];
                    lb.obj4cr_xc   = [];
                    lb.obj4cd_xic  = [];
                    lb.obj4cr_xic  = [];
                    lb.obj4cd_act  = [];
                    lb.obj4cr_act  = [];
                    lb.cd_pos      = [];
                    lb.cr_pos      = [];
                    lb.cd_cr_d     = [];
                case 1
                %input is already a lab, so just return!
                    if (isa(varargin{1},'lab'))		
                        lb=varargin{1};
                    else
                        error('Input argument is not a lab')
                    end
                case 26 
                %create a new lab (currently the only constructor method used)
                    lb.shape       = varargin{1};
                    lb.unit        = varargin{2};
                    lb.size        = varargin{3};        
                    lb.out_pos     = varargin{4};
                    lb.door_pos    = varargin{5};
                    lb.field       = varargin{6}; 
                    lb.empty_field = varargin{7};
                    lb.obj4cd      = varargin{8};
                    lb.obj4cr      = varargin{9};
                    lb.obj4cd_n    = varargin{10};         
                    lb.obj4cr_n    = varargin{11};   
                    lb.obj4cd_pos  = varargin{12};
                    lb.obj4cr_pos  = varargin{13};
                    lb.obj4cd_mex  = varargin{14};
                    lb.obj4cr_mex  = varargin{15};
                    lb.obj4cd_xint = varargin{16};
                    lb.obj4cr_xint = varargin{17};
                    lb.obj4cd_xc   = varargin{18};
                    lb.obj4cr_xc   = varargin{19};
                    lb.obj4cd_xic  = varargin{20};
                    lb.obj4cr_xic  = varargin{21};
                    lb.obj4cd_act  = varargin{22};
                    lb.obj4cr_act  = varargin{23};
                    lb.cd_pos      = varargin{24};
                    lb.cr_pos      = varargin{25};
                    lb.cd_cr_d     = varargin{26};
                otherwise
                    error('Invalid no. of input arguments for lab')
            end
        end
    end
end