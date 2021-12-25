classdef child
%declares child object
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------
    properties
    %define child properties (parameters) 
        pos;           %(1) agent position - vector containg x,y co-ords (double in general)
        speed;         %(2) distance the agent can move in each direction per iteration
        ex_range;      %(3) exploration range of agent from their position (how far they see in each direction)
        iwm;           %(4) child's iwm
        need4_cf2;     %(5) need for cf2 (true/false): if true, child asks for cf2
        need4_cf3;     %(6) need for cf3 (true/false): if true, child asks for cf3
        need4_cf4;     %(7) need for cf4 (true/false): if true, child asks for cf4
        p2need_cf2_x;  %(8) x of probability to need cf2
        p2need_cf3_x;  %(9) x of probability to need cf3
        p2need_cf4_x;  %(10) x of probability to need cf4
        p2need_cf2_xf; %(11)  fix for x of probability to need cf2
        p2need_cf3_xf; %(12) fix for x of probability to need cf3
        p2need_cf4_xf; %(13) fix for x of probability to need cf4
        p2need_cf2;    %(14) probability to need cf2 [CURRENT EMOTIONAL NEED]
        p2need_cf3;    %(15) probability to need cf3 [CURRENT PHYSICAL  NEED]
        p2need_cf4;    %(16) probability to need cf3 [CURRENT PHYSICAL  NEED]
        no_cf2_cntr;   %(17) number of iterations without receiving cf2 (not cared for counter)
        no_cf3_cntr;   %(18) number of iterations without receiving cf3 (not cared for counter)
        no_cf4_cntr;   %(19) number of iterations without receiving cf4 (not cared for counter)
        cf2_ed;        %(20) current emotional distance (0 to 100)
        cf3_pd;        %(21) current physical  distance (0 to 100)
        cf4_vu;        %(22) current vulnerability      (0 to 100)
        cf2_ed_trgt;   %(23) target emotional distance (0 to 100)
        cf3_pd_trgt;   %(24) target physical  distance (0 to 100)
        cf4_vu_trgt;   %(25) target vulnerability      (0 to 100)
        cf2_i;         %(26) indifference to the caregiver (100 * cd-explorations / (cd-explorations + cd-approaches))
        cf3_d;         %(27) distancing   to the caregiver
        cf4_d;         %(28) distancing   to the caregiver 
        cf2_i_trgt;    %(29) target indifference to the caregiver
        cf3_d_trgt;    %(30) target distancing   to the caregiver
        cf4_d_trgt;    %(31) target distancing   to the caregiver
        cf2_if;        %(32) fix for indifference to the caregiver
        cf3_df;        %(33) fix for distancing   to the caregiver
        cf4_df;        %(34) fix for distancing   to the caregiver
    end
 
    methods 
    %this class definition mfile contains only the constructor method
    %all other methods are included as separate mfiles in the @child folder 
    
        function cd=child(varargin)
        %constructor method for child - assigns values to child properties
       
            switch nargin          
            %Use switch statement with nargin,varargin contructs to overload constructor methods
                case 0				
                %create default object			
                    cd.pos           = [];
                    cd.speed         = [];
                    cd.ex_range      = [];
                    cd.iwm           = [];
                    cd.need4_cf2     = [];
                    cd.need4_cf3     = [];
                    cd.need4_cf4     = [];
                    cd.p2need_cf2_x  = [];
                    cd.p2need_cf3_x  = [];
                    cd.p2need_cf4_x  = [];
                    cd.p2need_cf2_xf = [];
                    cd.p2need_cf3_xf = [];
                    cd.p2need_cf4_xf = [];
                    cd.p2need_cf2    = [];
                    cd.p2need_cf3    = [];
                    cd.p2need_cf4    = [];
                    cd.no_cf2_cntr   = [];
                    cd.no_cf3_cntr   = [];
                    cd.no_cf4_cntr   = [];
                    cd.cf2_ed        = [];
                    cd.cf3_pd        = [];
                    cd.cf4_vu        = [];
                    cd.cf2_ed_trgt   = [];
                    cd.cf3_pd_trgt   = [];
                    cd.cf4_vu_trgt   = [];
                    cd.cf2_i         = [];
                    cd.cf3_d         = [];
                    cd.cf4_d         = [];
                    cd.cf2_i_trgt    = [];
                    cd.cf3_d_trgt    = [];
                    cd.cf4_d_trgt    = [];
                    cd.cf2_if        = [];
                    cd.cf3_df        = [];
                    cd.cf4_df        = [];
                case 1
                %input is already a child, so just return!
                    if (isa(varargin{1},'child'))		
                        cd=varargin{1};
                    else
                        error('Input argument is not a child')    
                    end
                case 34               
                %create a new child (currently the only constructor method used)        
                    cd.pos           = varargin{1};        
                    cd.speed         = varargin{2}; 
                    cd.ex_range      = varargin{3};
                    cd.iwm           = varargin{4};
                    cd.need4_cf2     = varargin{5};
                    cd.need4_cf3     = varargin{6};
                    cd.need4_cf4     = varargin{7};
                    cd.p2need_cf2_x  = varargin{8};
                    cd.p2need_cf3_x  = varargin{9};
                    cd.p2need_cf4_x  = varargin{10};
                    cd.p2need_cf2_xf = varargin{11};
                    cd.p2need_cf3_xf = varargin{12};
                    cd.p2need_cf4_xf = varargin{13};
                    cd.p2need_cf2    = varargin{14};
                    cd.p2need_cf3    = varargin{15};
                    cd.p2need_cf4    = varargin{16};
                    cd.no_cf2_cntr   = varargin{17};
                    cd.no_cf3_cntr   = varargin{18};
                    cd.no_cf4_cntr   = varargin{19};
                    cd.cf2_ed        = varargin{20};
                    cd.cf3_pd        = varargin{21};
                    cd.cf4_vu        = varargin{22};
                    cd.cf2_ed_trgt   = varargin{23};
                    cd.cf3_pd_trgt   = varargin{24};
                    cd.cf4_vu_trgt   = varargin{25};
                    cd.cf2_i         = varargin{26};
                    cd.cf3_d         = varargin{27};
                    cd.cf4_d         = varargin{28};
                    cd.cf2_i_trgt    = varargin{29};
                    cd.cf3_d_trgt    = varargin{30};
                    cd.cf4_d_trgt    = varargin{31};
                    cd.cf2_if        = varargin{32};
                    cd.cf3_df        = varargin{33};
                    cd.cf4_df        = varargin{34};
                otherwise
                    error('Invalid no. of input arguments')
            end
        end
    end
end
