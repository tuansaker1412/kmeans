# kmeans
K-means clustering ruby

Build gem: gem build kmeans.gemspec

Install gem: gem install ./nt_kmeans-0.0.1.gem

example:

```
use irb
2.3.8 :001 > require 'kmeans'
 => true
2.3.8 :002 > result = Kmeans.run k, data
result: array
result[0]: list centers
result[1]: data cluster sort by centers
```

k: (integer) number Cluster

data: (array) list Data
