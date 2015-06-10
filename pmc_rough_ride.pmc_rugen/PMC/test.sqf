
PMC_objectives_done = [];

PMC_objectives_done set [0, true];
PMC_objectives_done set [1, true];
PMC_objectives_done set [2, true];
PMC_objectives_done set [3, true];
PMC_objectives_done set [4, true];

hint format
[
	"{_x} count PMC_objectives_done: %1\n\nPMC_objectives_done:\n%2\n\ncount PMC_objectives_done: %3",
	({_x} count PMC_objectives_done == count PMC_objectives_done),
	PMC_objectives_done,
	(count PMC_objectives_done)
];
