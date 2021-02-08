(ns Solution
  (:gen-class)
  (:require [clojure.string :as str]))

(defn read-int-list
  []
  (map #(Integer/parseInt %) (str/split (read-line) #" ")))

(defn max-distance
  [l positions]
  (if (empty? positions)
    0
    (let [c (first positions)]
      (max c (- l c) (max-distance l (rest positions))))))

(defn -main
  [& args]
  (let [L (Integer/parseInt (read-line))
        N (Integer/parseInt (read-line))]
    (let [ls (read-int-list)]
      (println (max-distance L ls)))))
