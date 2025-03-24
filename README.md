An informal investigation of the affects of bulk Sr additions to Rb-Sr isochrons. Functions are stored in isochron_exploration.R. Each exploratory model has its own script, and its own sub-repository with output isochrons and a text log.

In summary, bulk Sr additions only seem to have a meaningful impact on Rb-Sr age via the impact on 87Sr/86Sr ratio. If there is a difference between the initial 87Sr/86Sr ratio of the isochron, and the 87Sr/86Sr ratio of the added Sr then the apparent inital Sr ratio of the isochron will shift. This shift is impacted by the relative abundance of Sr in the two systems, i.e., if a given spot in an isochron is Sr-rich it will show less impact from a Sr addition, while if the spot is relatively Sr-poor it will experience a large impact to its Sr ratios with an Sr addition. Apparent dates are impacted when a population forming an isochron have a wide variation in Sr abundance (e.g., model 6 exhibits a 100 million year error in isochron due to Sr addition). Understanding this behaviour a false isochron with negative age (i.e., "formed" 50 million years in the future) and be created if a 87Sr rich population that has a large variance in Sr abundance is flooded with 87Sr poor Sr (e.g., model 8, step 2).

Models were built by Adam Nissen with major intelectual contributions from Dawn Kellett and Kyle Larson.

Isochrons were formed using Isoplotr (Vermeesch, 2018).

Vermeesch, Pieter. "IsoplotR: A free and open toolbox for geochronology." Geoscience Frontiers 9, no. 5 (2018): 1479-1493.
