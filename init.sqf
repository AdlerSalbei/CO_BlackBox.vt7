enableSentences false;
enableRadio false;
enableSaving [false, false];

//0 enableChannel false;  // global
1 enableChannel false;  // side
2 enableChannel false;  // command
3 enableChannel false;  // group
4 enableChannel false;  // vehicle


// SCRIPTS =====================================================================
[] execVM "USER\userInit.sqf";

[] call grad_briefcase_fnc_addBriefcaseEHs;