classdef caregiver
%declares caregiver object
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------
    properties
    %define caregiver properties (parameters) 
        pos;           %(1) agent position - vector containg x,y co-ords (double in general)
        speed;         %(2) distance the agent can move in each direction per iteration
        ex_range;      %(3) exploration range of agent from their position (how far they see in each direction)
        iwm;           %(4) caregiver's iwm
        need2give_cf2; %(5) need to give cf2 (true/false): if true, caregiver gives cf2
        need2give_cf3; %(6) need to give cf3 (true/false): if true, caregiver gives cf3
        need2give_cf4; %(7) need to give cf4 (true/false): if true, caregiver gives cf4
        p2give_cf2_x;  %(8) x of probability to give cf2
        p2give_cf3_x;  %(9) x of probability to give cf3
        p2give_cf4_x;  %(10) x of probability to give cf4
        p2give_cf2_xf; %(11) fix for x of probability to give cf2
        p2give_cf3_xf; %(12) fix for x of probability to give cf3
        p2give_cf4_xf; %(13) fix for x of probability to give cf4
        p2give_cf2;    %(14) probability to give cf2 [CURRENT EMOTIONAL SENSITIVITY]
        p2give_cf3;    %(15) probability to give cf3 [CURRENT PHYSICAL  RESPONSIVENESS]
        p2give_cf4;    %(16) probability to give cf4 [CURRENT PHYSICAL  RESPONSIVENESS]
        no_cf2_cntr;   %(17) number of iterations without giving cf2 (no care counter)
        no_cf3_cntr;   %(18) number of iterations without giving cf3 (no care counter)
        no_cf4_cntr;   %(19) number of iterations without giving cf4 (no care counter)
        cf2_ed;        %(20) target emotional distance (0 to 100)
        cf3_pd;        %(21) target physical  distance (0 to 100)
        cf4_vu;        %(22) target vulnerability      (0 to 100)
        cf2_ed_trgt;   %(23) target emotional distance (0 to 100)
        cf3_pd_trgt;   %(24) target physical  distance (0 to 100)
        cf4_vu_trgt;   %(25) target vulnerability      (0 to 100)
        cf2_i;         %(26) indifference to the child (100 * cr-explorations / (cr-explorations + cr-approaches))
        cf3_d;         %(27) distancing   to the child
        cf4_d;         %(28) distancing   to the child
        cf2_i_trgt;    %(29) target indifference to the child
        cf3_d_trgt;    %(30) target distancing   to the child
        cf4_d_trgt;    %(31) target distancing   to the child
        cf2_if;        %(32) fix for indifference to the child
        cf3_df;        %(33) fix for distancing   to the child
        cf4_df;        %(34) fix for distancing   to the child
    end
    
    methods    
    %this class definition mfile contains only the constructor method
    %all other methods are included as separate mfiles in the @caregiver folder 
    
        function cr=caregiver(varargin)
        %constructor method for caregiver  - assigns values to caregiver properties

            switch nargin   
            %Use switch statement with nargin,varargin contructs to overload constructor methods
                case 0 
                %create default object
                    cr.pos           = [];
                    cr.speed         = [];
                    cr.ex_range      = [];
                    cr.iwm           = [];  
                    cr.need2give_cf2 = [];
                    cr.need2give_cf3 = [];
                    cr.need2give_cf4 = [];
                    cr.p2give_cf2_x  = [];
                    cr.p2give_cf3_x  = [];
                    cr.p2give_cf4_x  = [];
                    cr.p2give_cf2_xf = [];
                    cr.p2give_cf3_xf = [];
                    cr.p2give_cf4_xf = [];
                    cr.p2give_cf2    = [];
                    cr.p2give_cf3    = [];
                    cr.p2give_cf4    = [];
                    cr.no_cf2_cntr   = [];
                    cr.no_cf3_cntr   = [];
                    cr.no_cf4_cntr   = [];
                    cr.cf2_ed        = [];
                    cr.cf3_pd        = [];
                    cr.cf4_vu        = [];
                    cr.cf2_ed_trgt   = [];
                    cr.cf3_pd_trgt   = [];
                    cr.cf4_vu_trgt   = [];
                    cr.cf2_i         = [];
                    cr.cf3_d         = [];
                    cr.cf4_d         = [];
                    cr.cf2_i_trgt    = [];
                    cr.cf3_d_trgt    = [];
                    cr.cf4_d_trgt    = [];
                    cr.cf2_if        = [];
                    cr.cf3_df        = [];
                    cr.cf4_df        = [];
                case 1
                %input is already a caregiver, so just return!
                    if (isa(varargin{1},'caregiver'))		
                        cr=varargin{1};
                    else
                        error('Input argument is not a caregiver')
                    end
                case 34 
                %create a new caregiver (currently the only constructor method used)         
                    cr.pos           = varargin{1};         
                    cr.speed         = varargin{2};
                    cr.ex_range      = varargin{3};
                    cr.iwm           = varargin{4};  
                    cr.need2give_cf2 = varargin{5};
                    cr.need2give_cf3 = varargin{6};
                    cr.need2give_cf4 = varargin{7};
                    cr.p2give_cf2_x  = varargin{8};
                    cr.p2give_cf3_x  = varargin{9};
                    cr.p2give_cf4_x  = varargin{10};
                    cr.p2give_cf2_xf = varargin{11};
                    cr.p2give_cf3_xf = varargin{12};
                    cr.p2give_cf4_xf = varargin{13};
                    cr.p2give_cf2    = varargin{14};
                    cr.p2give_cf3    = varargin{15};
                    cr.p2give_cf4    = varargin{16};
                    cr.no_cf2_cntr   = varargin{17};
                    cr.no_cf3_cntr   = varargin{18};
                    cr.no_cf4_cntr   = varargin{19};
                    cr.cf2_ed        = varargin{20};
                    cr.cf3_pd        = varargin{21};
                    cr.cf4_vu        = varargin{22};
                    cr.cf2_ed_trgt   = varargin{23};
                    cr.cf3_pd_trgt   = varargin{24};
                    cr.cf4_vu_trgt   = varargin{25};
                    cr.cf2_i         = varargin{26};
                    cr.cf3_d         = varargin{27};
                    cr.cf4_d         = varargin{28};
                    cr.cf2_i_trgt    = varargin{29};
                    cr.cf3_d_trgt    = varargin{30};
                    cr.cf4_d_trgt    = varargin{31};
                    cr.cf2_if        = varargin{32};
                    cr.cf3_df        = varargin{33};
                    cr.cf4_df        = varargin{34};
                otherwise
                    error('Invalid no. of input arguments for caregiver')
            end
        end
    end
end