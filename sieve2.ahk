tic:=QPC(1), Arr2:=FindPrimes2(16000000), toc:=(QPC(1)-tic)
MsgBox, % "Processing took " toc " sec.`nand " Arr2 " Was the final answer"
ExitApp

; Finds all prime numbers <= n (16,000,000)
; Returns the one millionth prime found.
FindPrimes2(n){
	VarSetCapacity(ii,n,49),is_prime:=StrSplit(StrGet(&ii,n,"CP0")),is_prime[1]:=0,is_prime[0]:=0,i:=2,count:=1
	While ((j:=i*i)<=n)
		{
		If is_prime[i]
			{
            count++
			While (j<=n)
				is_prime[j]:=0, j+=i
			}
		i++
		}
    While (i<=n)
        {
            i := i+2
            if is_prime[i]
                count++
            if count >= 1000000
                break
        }
	Return i
}

QPC(R:=0){ ; By SKAN, http://goo.gl/nf7O4G, CD:01/Sep/2014 | MD:01/Sep/2014
  Static P:=0, F:=0, Q:=DllCall("QueryPerformanceFrequency","Int64P",F)
  Return !DllCall("QueryPerformanceCounter","Int64P",Q)+(R?(P:=Q)/F:(Q-P)/F)
}
