def accumulate(n):
    Sn = 1/2*(3/2 - 1/n - 1/(n+1))
    Forward, Reverse = 0, 0
    for i in range(2, n+1):
        Forward += 1/(i**2 - 1)
    for i in range(n, 1, -1):
        Reverse += 1/(i**2 - 1)
    print('The N is set as:', n, '\nThe accurate value is: Sn =', float(Sn),
          '\nThe result in forward order is: Forward=', Forward, '\nThe result in reverse order is: Reverse=', Reverse)
    print('Error in Forward order: |Sn-Forward|=', abs(Sn - Forward), '\nError in reverse order: |Sn - Reverse|=', abs(Sn - Reverse))
if __name__ == '__main__':
     N = [100, 10000, 1000000]
     for i in N:
         accumulate(i)