TITLE minimal model of AMPA receptors

NEURON 
{
	POINT_PROCESS newAMPA
	RANGE C, g, gmax, lastrelease, TRise, tau
	NONSPECIFIC_CURRENT i
	RANGE Cmax, Cdur, Alpha, Beta, Erev, Deadtime
}

UNITS 
{
	(nA) = (nanoamp)
	(mV) = (millivolt)
	(umho) = (micromho)
	(mM) = (milli/liter)
}

PARAMETER 
{
	TRise (ms)
	tau   (ms)
	Cmax	= 1	(mM)		: max transmitter concentration
	Erev	= 0	(mV)		: reversal potential
	Deadtime = 1	(ms)		: mimimum time between release events
	gmax		(umho)		: maximum conductance
}


ASSIGNED 
{
	Alpha	(/ms mM)	: forward (binding) rate
	Beta	(/ms)		: backward (unbinding) rate
	Cdur	(ms)		: transmitter duration (rising phase)
	v		(mV)		: postsynaptic voltage
	i 		(nA)		: current = g*(v - Erev)
	g 		(umho)		: conductance
	C		(mM)		: transmitter concentration
	lastrelease	(ms)		: time of last spike
}

STATE
{
	R				: fraction of open channels
}

INITIAL 
{
	R = 0
	C = 0
	lastrelease = -1000
	Cdur=TRise
	Beta=1/tau
	Alpha=1/Cdur - Beta
}

BREAKPOINT 
{
	SOLVE states METHOD euler
	g = (gmax * R * (Alpha+Beta)) / (Alpha*(1-1/exp(1)))
	i = g*(v - Erev)
}

DERIVATIVE states
{
	R'=Alpha * C * (1-R) - Beta * R
}


