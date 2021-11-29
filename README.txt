----------------------- Hybrid Firefly Algorithm -------------------------------

All algorithms are based on the implementation of Xin-She Yang:
https://ch.mathworks.com/matlabcentral/fileexchange/29693-firefly-algorithm

The algorithms have been changed in a manner that they can be called as a function 
by providing all neccessary parameters, also the ones relevant for hybridization, to it, 
returning the best firefly and the best objective function evaluation.

The hybridization is marked in the code with:
%------Here starts the customizing------
Hybridization
%------End of the customizing----------- 

In the main file, it can be seen how the data was collected, by running each setup
100 times. Also the main file shows how the algorithms can be used.

Examples:
All alogrithms share the hybrid enabled parameter, if this is set to 0, the hybridization will not take place.

		Population	Iterations	Hybrid enabled		Hybrid created after (Iteration - Iteration/6)
firefly_simple([12 		100 		1 			6]);

	 Population	Iterations	Alpha	Beta	Gamma	Hybrid enabled	Hybrid created after	Probability threshold
fa_ndim([40 		800 		0.5 	0.2 	1 	1 		6 			0]);

In the experimental setups the same parameters are used, just the way of the hybridization changes. 
	 	Population	Iterations	Alpha	Beta	Gamma	Hybrid enabled	Hybrid created after	Probability threshold
fa_ndim_exp(	[40 		800 		0.5 	0.2 	1 	1 		7 			0]);

The data produced by the main file, can automatically be analysed with the Evaluations file.
The evaluations file will calculate the best, worst and average of the data set and store
it in file.



