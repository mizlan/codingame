(ns Solution
  (:gen-class)
  (:require [clojure.string :as str]))

(defn digits [n]
  (->> n str (map (comp read-string str))))

(defn get-next
  "Perform the function to get the next number"
  [n]
  (apply + (map #(* % %) (digits n))))

(defn terminate
  "Return 1 if number terminates to 1"
  ([n] (terminate n #{}))
  ([n st]
   (if (= n 1)
     true
     (if (contains? st n) false
         (terminate (get-next n) (conj st n))))))

(defn is-happy
  "Check if number is happy"
  [n]
  (terminate n))

(defn -main
  "Entry point"
  [& args]
  (let [N (Integer/parseInt (read-line))]
    (loop [i N]
      (when (> i 0)
        (let [x (bigint (read-line))]
          (if (is-happy x)
            (println (str x) ":)")
            (println (str x) ":(")))
        (recur (dec i))))))
