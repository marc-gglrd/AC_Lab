classdef iwm
%declares iwm (Internal Working Model) object
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------
    properties
    %define iwm properties (parameters) 
        ad2_av;        %(1) avoidance   - attachment dimension 2 (ad2)
        ad3_am;        %(2) ambivalence - attachment dimension 3 (ad3)
        ad4_ph;        %(3) phobicity   - attachment dimension 4 (ad4)
        thrshld4_ad2;  %(4) attachment threshold for ad2 (if Pn > this, then ask4 cf2) (Pn: prob. to need cf2)
        thrshld4_ad3;  %(5) attachment threshold for ad3 (if Pn > this, then ask4 cf3) (Pn: prob. to need cf3)
        thrshld4_ad4;  %(6) attachment threshold for ad4 (if Pn > this, then ask4 cf4) (Pn: prob. to need cf4)
        cf2_in;        %(7) insensitivity    - caregiving feature 2 (cf2)
        cf3_un;        %(8) unresponsiveness - caregiving feature 3 (cf3)
        cf4_li;        %(9) limitation       - caregiving feature 3 (cf4)
        thrshld4_cf2;  %(10) caregiving threshold for cf2 (if Pg > this, then give cf2) (Pg: prob. to give cf2)
        thrshld4_cf3;  %(11) caregiving threshold for cf3 (if Pg > this, then give cf3) (Pg: prob. to give cf3)
        thrshld4_cf4;  %(12) caregiving threshold for cf4 (if Pg > this, then give cf4) (Pg: prob. to give cf4)
    end
    
    methods 
    %this class definition mfile contains only the constructor method
    %all other methods are included as separate mfiles in the @iwm folder 
    
    function wm=iwm(varargin)
        %constructor method for iwm - assigns values to iwm properties
       
            switch nargin          
            %Use switch statement with nargin,varargin contructs to overload constructor methods
                case 0				
                %create default object			
                    wm.ad2_av        = {};
                    wm.ad3_am        = {};
                    wm.ad4_ph        = {};
                    wm.thrshld4_ad2  = {};
                    wm.thrshld4_ad3  = {};
                    wm.thrshld4_ad4  = {};
                    wm.cf2_in        = {};
                    wm.cf3_un        = {};
                    wm.cf4_li        = {};
                    wm.thrshld4_cf2  = {};
                    wm.thrshld4_cf3  = {};
                    wm.thrshld4_cf4  = {};
                case 1
                %input is already an iwm, so just return!
                    if (isa(varargin{1},'iwm'))		
                        wm=varargin{1};
                    else
                        error('Input argument is not an iwm')    
                    end
                case 12               
                %create a new iwm (currently the only constructor method used)        
                    wm.ad2_av        = varargin{1};
                    wm.ad3_am        = varargin{2};
                    wm.ad4_ph        = varargin{3};
                    wm.thrshld4_ad2  = varargin{4};
                    wm.thrshld4_ad3  = varargin{5};
                    wm.thrshld4_ad4  = varargin{6};
                    wm.cf2_in        = varargin{7};
                    wm.cf3_un        = varargin{8};
                    wm.cf4_li        = varargin{9};
                    wm.thrshld4_cf2  = varargin{10};
                    wm.thrshld4_cf3  = varargin{11};
                    wm.thrshld4_cf4  = varargin{12};
                otherwise
                    error('Invalid no. of input arguments')
            end
        end
    end
end
