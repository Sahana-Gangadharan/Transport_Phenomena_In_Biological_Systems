TITLE Pulse of calcium

NEURON {
	SUFFIX capulse
	USEION ca WRITE ica	
	RANGE pulseamp, pulsedur, pulsedel
}

UNITS {
	(mA)	= (milliamp)
}

PARAMETER {
	pulseamp=1 (mA/cm2)
	pulsedur=2 (ms)
	pulsedel=10 (ms)
}

INITIAL {
	ica = 0
}

ASSIGNED {
	ica		(mA/cm2)
}
	
BREAKPOINT {
	if(t>=pulsedel && t<=pulsedel+pulsedur) {
		ica=-pulseamp
	} else {
		ica=0
	}	
}	
