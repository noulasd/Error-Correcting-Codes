P.<x> = PolynomialRing(IntegerModRing(3))

l=[[x^6 + x^4 -x^3 -x +1, x^6 -x^5 -x^4 -x^3 + x^2 +1 , x^10 + x^9 + x^8 + x^7 + x^6 + x^5 + x^4 + x^3 + x^2 + x + 1, x-1 , x^5 + x^4 - x^3 +x^2 - 1, x^5 - x^3 + x^2 -x - 1],[x^5 -x^3 + x^2 -x -1,x^5 + x^4 - x^3 +x^2 - 1 , x-1 , x^10 + x^9 + x^8 + x^7 + x^6 + x^5 + x^4 + x^3 + x^2 + x + 1, x^6 -x^5 -x^4 -x^3 + x^2 +1 , x^6 + x^4 -x^3 -x +1 ]]
for k in range(0,len(l[0])):
	a=l[0][k]
	b=l[1][k]
	# The "quo_rem" returns an ordered pair: (quotient,remainder) and does the division 
	# according to the polynomial ring to which a and b belong.
	tmp = a.quo_rem(b) 
	r=[a,b,tmp[1]]
	q=[0,0,tmp[0]]
	i=2
	# While we have yet to reach a zero remainder continue divisions tacking on the new
	# quotient and remainder to our lists q and r.
	while r[i] != 0:
		i=i+1
		tmp = r[i-2].quo_rem(r[i-1]) 
		q.append(tmp[0])
		r.append(tmp[1])

	lc = r[i-1].coefficients()[-1]
	A = 1
	B = -q[i-1]
	for j in reversed(range(2,i-1)):
		tmp = B
		B = A-q[j]*B
		A = tmp
	# (A/lc) * a + (B/lc)*b = r[i-1]/lc
	# print(A/lc)
	print("$\\bigg("+str(latex(A/lc))+"\\bigg)\\bigg("+str(latex(a))+"\\bigg) + \\bigg("+str(latex(B/lc))+"\\bigg)\\bigg("+str(latex(b))+"\\bigg) = "+str(latex(r[i-1]/lc))+"$")
	#print (A/lc)*a