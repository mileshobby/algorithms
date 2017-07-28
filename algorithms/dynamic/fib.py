
#get first n fibs
def iter_n_fibs(n):
    if n == 0:
        return [0]
    elif n == 1:
        return [0, 1]
    fibs = [0, 1]
    while len(fibs) < n:
        fibs.append(fibs[-1] + fibs[-2])
    return fibs

print(iter_n_fibs(10))

def recur_n_fibs(n, cache = {0: [0], 1: [0, 1]}):
    if n in cache:
        return cache[n]
    else:
        second_last = recur_n_fibs(n - 2)
        last = recur_n_fibs(n - 1)
        this_fib = second_last[-1] + last[-1]
        cache[n] = last + [ this_fib ]
        return cache[n]

print(recur_n_fibs(10))
