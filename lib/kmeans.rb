class Kmeans
  require 'json'

  def self.hi
    puts "K-means clustering ruby!"
  end

  def self.run k, data
    # random first centers
    centers = data.sample(k)
    y = []
    (0..(k-1)).each do |i|
      y[i] = []
    end
    while true
      # save pre-loop groups
      y_old = y
      # grouping
      y = group_data(data, centers)
      # break while loop if groups are not changed
      if y === y_old
        break
      end
      # update centers
      centers = []
      y.each do |ct|
        centers.push(getCenter ct)
      end
    end
    return centers, y
  end

  def self.group_data data, centers
    y = []
    (0..(centers.length-1)).each do |i|
      y[i] = []
    end
    list = []
    data.each do |x|
      centers.each do |center|
        list.push(euclidean_distance(x, center))
      end
      min = argmin(list)
      y[min].push(x)
      list = []
    end
    return y
  end

  # cosine
  def self.euclidean_distance p1, p2
    sum_1 = 0
    sum_2 = 0
    sum_12 = 0
    p1.each_with_index do |p, i|
      sum_1 = sum_1 + p**2
      sum_12 = sum_12 + (p1[i].to_f * p2[i].to_f)
    end
    p2.each_with_index do |p|
      sum_2 = sum_2 + p**2
    end
    return 1 - sum_12 / (Math.sqrt(sum_1) * Math.sqrt(sum_2))
  end

  def self.getCenter ps
    p = []
    ps.each do |p1|
      p1.each_with_index do |p2, i|
        p[i] = p[i].to_f+ p2.to_f
      end
    end
    p.each_with_index do |p3, i|
      p[i] = p[i]/ps.count
    end
    return p
  end

  def self.argmin arr
    i = 0
    (1..(arr.length-1)).each do |index|
      if arr[i] >= arr[index]
        i = index
      end
    end
    return i
  end
end
