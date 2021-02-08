(ns Solution
  (:gen-class)
  (:require [clojure.string :as str]))

(defn query-psum
  "One-indexed"
  [prefix-sums l r]
  (- (get prefix-sums r) (get prefix-sums (- l 1))))

(defn build-psum-helper
  [ls]
  (if (empty? ls)
    '(0)
    (let [prev (build-psum-helper (rest ls))
          tip (first ls)]
      (conj prev (+ tip (first prev))))))

(defn build-psum
  [ls]
  (vec (reverse (build-psum-helper (reverse ls)))))

;; Maximum money on cur-day, TAKING that day's prize
(def solve
  (memoize (fn
    ([N R prefix-sums] (solve N R prefix-sums N))
    ([N R prefix-sums cur-day]
     (if (<= cur-day 0)
       0
       ;; [l, r)
       (let [l (max 0 (- cur-day R 1))
             r (- cur-day 1)
             prev-days (range l r)]
         (if (<= cur-day R) (query-psum prefix-sums 1 cur-day)
             (apply max (cons (query-psum prefix-sums cur-day cur-day)
                              (map
                               #(let [prior-day %
                                      rest-day (+ % 1)]
                                  (+ (solve N R prefix-sums prior-day)
                                     (query-psum prefix-sums (+ rest-day 1) cur-day)))
                               prev-days))))))))))

(defn sol-wrapper
  [arr R]
  (let [psums (build-psum arr)
        N (count arr)]
    (apply max (map #(solve N R psums %) (range 1 (+ 1 N))))))

(defn -main
  [& args]
  (let [in (str/split (slurp *in*) #"\s")
        data (map #(Integer/parseInt %) (rest in))
        R (first data)
        inp (rest data)]
    (println (sol-wrapper inp R))))
