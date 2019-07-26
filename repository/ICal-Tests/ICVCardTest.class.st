Class {
	#name : #ICVCardTest,
	#superclass : #ICTest,
	#category : 'ICal-Tests-Core-VCard'
}

{ #category : #'fixtures-parsing' }
ICVCardTest >> aviCardString [
^
'BEGIN:VCARD' , String crlf ,
'VERSION:3.0' , String crlf ,
'N:Bryant;Avi;;;' , String crlf ,
'FN:Avi Bryant' , String crlf ,
'EMAIL;type=INTERNET;type=WORK;type=pref:avi@smallthought.com' , String crlf ,
'EMAIL;type=INTERNET;type=HOME:avi.bryant@gmail.com' , String crlf ,
'TEL;type=HOME;type=pref:(778) xxx-xxxx' , String crlf ,
'TZ:-05:00' , String crlf ,
'item1.ADR;type=HOME;type=pref:;;xxx E. xx Ave;Vancouver;BC;V5V 1E3;Canada' , String crlf ,
'item1.X-ABADR:ca' , String crlf ,
'item2.X-AIM;type=pref:avbry' , String crlf ,
'item2.X-ABLabel:_$!<Other>!$_' , String crlf ,
'item3.X-MSN;type=pref:avi666@hotmail.com' , String crlf ,
'item3.X-ABLabel:_$!<Other>!$_' , String crlf ,
'PHOTO;BASE64:' , String crlf ,
'  TU0AKgAAHVRMUWlAR142PVQoL0QcIjIZGycXGB8aGBsYFBceExUuHBw6IR9IJiVVLi9ZLzNaLzZa' , String crlf ,
'  MjVVLjFRKS9HJCg+HyU2HCAuFx8mExkgEBohFR8kHScnIy8lIzEdHSoWFykWFykaGSkaGSkZGi4Z' , String crlf ,
'  GiwXGisXGycYGiYXGSMYHCcUGCQUGioVGy0RFioQFigUFygTFiUXFyQYGCUlKj4vNEgoL0IbITMX' , String crlf ,
'  GCgTERwVEBYYDxIcERMwIiJKNDRgREF0UE+EXFyLY2aSaGyTaWuPZ2iKYmOBWlt2VFVrS05fQENQ' , String crlf ,
'  NjlAKi06JSoxICgoGyQjFyEcFR8cFCMbFSMaFiQZFyUXGCoXGisVGysYGyoZGygXGSUYGiYYGicX' , String crlf ,
'  GisWGSwVGCsXGi0ZGioWGCUWFiMXFyQnLTswNkQjJjUQEh8TDRkXDRUiERcsGBpAKixlTE2FZ2WW' , String crlf ,
'  dXCpg362j4q9lZXAmJjEmJfClpO9kY60iIOtgXyofHefc26SaWWIYVx9V1RtS0pbPT1KLTE8IiYu' , String crlf ,
'  Fx8hDhYcEBkYExwUFiMUGigTGywTGywYGSsaGSkaFiUbFyYZGCgWFykXGCoaGysbGygZFyUWFiMU' , String crlf ,
'  FiM8Q0s8QEkqLDgVER0cEBkvHiQ4HyJLLjB9XmGlg4K4lZHBm5bRqKLbtK3euLXfubbjt7ThtK/b' , String crlf ,
'  r6jUpZ/NnpbKmZLEk4y8i4SygXqsfXeleHOabmuKYGF7VFVoREZSMzYyHB8lFhsZFBsWFiIUFyYR' , String crlf ,
'  FycWFykaFygaFScaFiUYFSYYFycYGSkaGicYFiMYFiMUFiMUFiM3PD82OT0rLDEeFx4yIyhSPD9P' , String crlf ,
'  MDN2UlK6k5TTq6vYr6vZsKrnvrjux8DsycXoxcHrwr7rv7rovLfluLPesqvaq6XUo57NnJfKmZTF' , String crlf ,
'  lI/BkIu6iIWwgHypeXebbmuJYF5yTk1TNzY0HyQjFh8bFSEXFSMXFiYYFycaFygaFygYFycZGCgZ' , String crlf ,
'  GygXGSYXFyMUFiIVFyQTFiUmLCwmKisjIiclHyNNPEBsUlVnRUaogYLetrbrwsDmurfcsKvkvLTy' , String crlf ,
'  y8Tyz8nuy8Xux8Dsw73swLvrv7rpvLfkt7LgsKzbqqXZpqLUoZ3Om5fIlZHBjoi8iYO0gXupeHGb' , String crlf ,
'  b2iJYFxxTU1TNjozICYdEBoXDxwZFSMWFCIWFiMWFSUWFSUWFycYGicXGycVGSUUFyYTFiUeIiMg' , String crlf ,
'  IiMeHSIqJChVREhuVVh9Xl7Npqfuxsbyy8jpwLzSqaPMoZrVrKbgurXkwbvowbrpw7rsw73txL7s' , String crlf ,
'  wL3qvbrpubfltbHgrqvcq6bYpaHToJrQm5PKlY3AjIG5hXqyfHKqdW2cameGXVttS0xRNzozIiYc' , String crlf ,
'  EhoZFB0UEh8TEyAUEyMTFCQVGCcVGykSGicUFyYUFyYaHh8fISIeHSIiHCBCMTVhSEuSc3PgvLv2' , String crlf ,
'  z8/0zcrwx8PWrae2i4SkfHSngXy3kYzGoJnSq6ThuLLov7nrv7rtwLvuvrrrubbms6/ir6vdqKLZ' , String crlf ,
'  pJzWopfQnJHJlYrHkYXEi4C/hnuzfHWjcmuVaWSEXltmSklINDUoGR4cEhsYEh4YFiQVFCQRFCMR' , String crlf ,
'  GSYRGSYVGCcVGCcbHR4YGhsZGB0fGR0zJCdWQEKoiojsysj+19f2z8zqwb3Xrqi4jYaccWqHYFuH' , String crlf ,
'  YVySbGelf3jCm5TWqqXhta7su7bvvLbwu7Xsta7pr6nfqKHcppzbpZvVoZbNmY7JlYrJk4fGkIS+' , String crlf ,
'  in20gnWpeG+ccGeNZF54VFNdPkE6ICcjEhobERwXEyEUFiMQFiQRFyUVGCcWGCUdHR8YGBoYFhkf' , String crlf ,
'  Fhk1JChhS0u9n53z0s371dL50s3ov7nMoZq4jIOyhn2ddG6BWlVzTUh2UEuMZV6vg37On5nerabl' , String crlf ,
'  sKrpsqvts63psKfjqaPdpJvaoJrUnZbOmZHMl4/Nl43LlYnEkIO+in23g3avfXKmdW6WamOCWVdn' , String crlf ,
'  Q0NFKy4pFhwcEBkZFSEWFiMSEyMVFyQWGCQVExQSEBEWEhMfFBY8Kit7YmDevLr/2db/19X6zsvq' , String crlf ,
'  vrfOn5e3iIC9jobBlZCnfniGYFtxS0ZnQDt1TEaXamW5ioTOm5fapZ/cpaDhp6HgpqLdopzan5vV' , String crlf ,
'  m5fRl5PPlY/RmpPPmY/LlYvGkofCjoO+in+2g3urenGaa2ONYVxyTElOMC4vGx0aDhQRDBUVEyAX' , String crlf ,
'  FSIYGCIZFRQaFhUfGRsqHiBHMzSafn3wzMv+19T/1tL7z8rzxL7YqaG+jYbCk4vTpqG+ko2sg32W' , String crlf ,
'  bWd7UkxnOzZkNzJ2R0GYZ2K5hoDJlI7RmpXXnZnWm5XVmJPUl5LUl5LTmJLWnJbXnZfUmpTTmpHO' , String crlf ,
'  mI7JlYrCkIW5iH+se3KecmePZF16VE9ZOzk0ICEaDxUUDxYUERoWFR0nISErIiMuIyc6Ky5XQUO5' , String crlf ,
'  m5v609P+1dP/1dL90cz1xsDgsanFlI24iYHGmZTKnpm3i4SoeXGWZ2GFVlBwQTtiMSprOjOGU02o' , String crlf ,
'  c225gnvJj4nOkorPkInQkYrUk4vWl5DWm5XZnpjZnJfZnpjXnZfQm5PIl47AlIm5jYKugneldmyW' , String crlf ,
'  a2J9V1JbPzw2JCQXDBATDhQTEBcwJScxJigyJipALzNuVVjRs7P91tb/2tf/2df/1dL1yMPsvbfS' , String crlf ,
'  o52md3Gfcm+6jYrCk420g3yfbmeMW1SAT0h3Rj1xQDd4RT2IVEmgamC6gXjFi4DHi4HKi4LPkIfS' , String crlf ,
'  lozVmpTZnpjanZjcopnboZvUn5fNnpbInJPClo29kYi2h32menGQaGB3Vk9TOjYpGRkXDhEQDhE0' , String crlf ,
'  KCoyJig0JSpFNDqLcnbgwcT41tX+19f/2Nj/2tf80M/3ysfmtrS5iYeNX2GEV1aebmygcGyXZmGC' , String crlf ,
'  UUp2QztzQTZ0QjV9STyFUkOZZlesd2m0fnK2gHS7gnfBiH3EjoTGj4jLlI3Ql4zWnZLXoZfUn5fQ' , String crlf ,
'  nZnQnpvLm5fFmJO8jYevg3yienKPaWJvTklHLysiFxkSDg83KCs0JSg5KC5PPECljI/qzMz41tX8' , String crlf ,
'  1dX/19f91NL90M/9zcvywL/aqKeoeHh/T09tPT1qODdlMzBiMSxfLiddKyBnMyZ6RziOW0yaZ1al' , String crlf ,
'  cmOqdWeqdGipdWiodGmmdGmlcmqtenK0gne+jIHFlIvGlY7Gl5HImJTGmZbIm5i9kIuzhoGsgXqb' , String crlf ,
'  c2uCW1RkRUI3JyceFRY3Jiw0Iyc5JyhmUlPBp6jszsz20tH709P/0tH+zs7/y83/ysr2wL7kr6vE' , String crlf ,
'  kI6daWd8SEpsODphMTFdLSlgMStnNi9uPDGBTUCPXk+kcWKueWmqcmWhaF2cZlqPW1CBUUV1Rjx1' , String crlf ,
'  SUCBVk2MZFqXcWideG+ngXqwiYK3joi7koy6jYi6joe2ioOne3SRZF9wSUZNNDIvHRs1JCoxICRB' , String crlf ,
'  LzB/aWnPtrTszcvyy8v5z9D+zs7/y83+yMj+xsf3v77rtLHVnpu2gX2ja2yOWFp9S0x1RUN6SkaC' , String crlf ,
'  UUqJVEyUYFWfa163hHW9iHqze26jal+QWk55RzxnOC5dMShVLSNSLCNVMCdhPjZlRDttTEN+W1OK' , String crlf ,
'  ZF2YcmueeG+je3OpgXmrgHmYbGd4UUxXOTY+JSEzJCcxIiVNOzyVf3/Xu7rmx8XsxcX2zcv8zMz/' , String crlf ,
'  y83/x8r/xMb7wMDzubfjrKnQmZbDiIq5foCseHihb2ydbGedamSfaGGmcGa7hXvSnJDVnJHCiX6n' , String crlf ,
'  bmODT0RpOjBZLSJUKSBVLSVYLylVLidVLilMJiFKJB9RLihdPDNjQjlkRztpTEB2WU2BYVZ7W1Bu' , String crlf ,
'  TURaPTVILSQmGhwuICBUQkKijIzVubjfwL3mwL3sw8HywsL4xMb7w8b+wsT+wsT5vb3utLLkqqjf' , String crlf ,
'  oaLYnJzQmJfLlZPJlJDKk5DLkY3QlpDcpZ7rtavnsafQmpCqdGp8SUFqPjNgNSxPJx9NJB5ZMCph' , String crlf ,
'  ODJlPDhjOjZhOjVeODNbODBXOS9VOCxUOCxZPTFfQzdgQzdjRjpgQzdSNSkrICIvJCNYRkaqlZLQ' , String crlf ,
'  tLHVs7HctrPhuLTpubnwvL74vcH7vcD9v8L6vL3zuLbxtrTsr67mqajfpaPZop/coaHdoqLip6Xo' , String crlf ,
'  rqz2v7z8xcD2v7rcp5+ueXGBUEl1SUBqPzZcMCtQJCFYLClpPTp6Tk19VFJ8U093UEt0TkdzUEhy' , String crlf ,
'  UEZsTD9tTUByUkV0UkZ0UkZpSTxaOi00KywxJyZXR0eympjOsK7Ip6LQqqXXrqrfr63ksLDus7fx' , String crlf ,
'  s7b1tLb2trbztrX3urf0t7TxtLHrsK7mrKrmqqrpra3ytrb7wMD/ycj/zcn6xcHeq6Wyf3mSYVqJ' , String crlf ,
'  WlJ3S0RnOjVcMC1ZLSpgNzN7UlCMY2GMZWCHYFuHYFmBW1J4UkdzTkN7VUqHYVaMZluFYFV0UkZf' , String crlf ,
'  PTEhGxspHx5XR0e0nJrLraq/nJjEnpnHnpjNoJvTn53fpKbjpabmpafoqKjrq6vws7D4u7j3vLjz' , String crlf ,
'  uLbyt7X0uLj2urz6v8H+w8X/y8v/y8n1wr7ap6O1gnykcWuhbmiWZWCAUExrPjtVLCpRKidoQj+A' , String crlf ,
'  XVmOaGOOaGOJYluEXFSCV06JXlOTZ1ybcGWec2iRaV9+XFJfPzQXEREqIB9dTU2zm5nEpqO4lY++' , String crlf ,
'  mJG8k422iYS5iIPGi4vJjIvIiIjIhoXJiYfOkYzTmJLkqaXyuLb6v7/7wML5wcL7w8b7xcf/zM7+' , String crlf ,
'  ysrvu7nToJy2gXuvenSzfHe0f3mlcW+FVVNuQT5aMS9NJyROKCNYMi1fODFsRDx/U0qYaV+vfnWy' , String crlf ,
'  g3mxgnisgHWXb2V/XFRYOjIRCw0kGRtUREStlZO8npu4lY/AmpOzi4OjeHGebWaga2eeY1+XWleZ' , String crlf ,
'  WVWaWlaeYVy5fnjboZ3ut7T2wL74xMT9y8z5xsr/zc7/zM79ycnmrq3LlJHAhoK4fni6f3nCh4HA' , String crlf ,
'  hoSweniWYmB6SkhqPjtjNzReMi9mOjV8UEmgb2i8iYHGk4vEk4q9joSwhHmbdWx4WlRGLSkUDhAp' , String crlf ,
'  ICFURESfioe3mZa2lY68lo+vh3+ab2aKXlWDUEqGUUuUWVOeYVymaWSwc27KkIz3wL3/zMr7x8f7' , String crlf ,
'  y8v8z87/09X/0NP/zc/2vr/doqLLkIzEiYPBhX3GioLKjYjKj43JjY28hIOrdXOcaGiQXluSYF2h' , String crlf ,
'  bmqwfXnDjojOmZPOm5PHlo27j4awhXyWcGliSUUzIBwcGBswJypNPz+KdnWwlJC1lI25k4yviYCi' , String crlf ,
'  enCab2aRZVySY1ulcGq1fnfBhoDHjIbjqaf/zMv/0tL/z8/+0tH/2Nn/2dr/0dT/yszusrLYmJjN' , String crlf ,
'  jYvLi4fJjYXPk4vTl4/WmZbZnJvUl5bNkpDKjo7FiYnGiorMkY/Wm5naoJzYoZzSn5nJmpK7kImv' , String crlf ,
'  h3+LamNKNTIkFhMeGh0sJig+MzJxX12jioavkYm0kYmzjYSxi4KadGuIYlmDW1OccGm7ioXMlZDO' , String crlf ,
'  l5Tjq6r/zs7/1Nb/2Nj/2Nn/2tr/1df/09P/xsjxsLLenJ3UkI/OjorNkYnSlo7fo5vfpJ7ip6Pe' , String crlf ,
'  oaDeoaDho6TeoKHfoqHeoaDhpKPfpaPapaHRoJvHmpW3kImmg311WlM0JCIbEQ8eGR8uKCw9MjRd' , String crlf ,
'  T0yMd3Keg3ypiIGviYKhe3R4VU1tTEN1UkqRamOvg37AjovCjozHk5Psurv/zc7/09b/1Nb+0dP/' , String crlf ,
'  0ND/zM7/w8XzsLPno6TZlZTUlJDQlIzIjITUmpHepJ7iqKLhp6Pnranssa/oravlqanipqbfpKTd' , String crlf ,
'  paTVo6DJnJe/mJOwj4iWeXNZRD8lGhYXEg8dGB4tKSw8MzRIPTtnVE59ZV2TdW2ee3OCYVhaPDRX' , String crlf ,
'  OjJkR0F6WVSTbGmpfHuxf4Ccb26tgH/qt7v/z9P/0dX/z9P+ysz9xcb8u73wrq/ppaTfnZzgo57U' , String crlf ,
'  mZO0enGudGvGi4XVm5Xhp6PnranqsK7rsa/nrKzfpKTbo6LYoqLPn53Al5W3lJCmiIV9ZWFBMCsd' , String crlf ,
'  FRIcGRUbGB4oJCc2MjE5MS5JOjVlTUiCZV+ObWZpS0NNMCpELSVQODNkSER3VVORZGaPYWN6UU95' , String crlf ,
'  TUy9io76w8j/zNL/xs36vsL8vsH3tLfsqqvlpaPjpqPkqaPQlpCtcmybXlmoZmPBgX3Ym5jeo5/d' , String crlf ,
'  pqPiq6jhqajdpabYoqLRnZ/ImJi5j5Cti4qUeHViTUouIB0kHxwsKikZFhwcGh0pJygsJyQ0KSVO' , String crlf ,
'  OzVoT0pwU01iRT9OMyxBKSFHLilVNzRfOzt6TVB4SkxzTUpoQj95TEvOmpz0uL/xs7jvrLPxrrPu' , String crlf ,
'  q67np6ffoqHdop7Umpa+h4Ctc2+hZmCVVVGjY1+7fnvLkY3TnJnUoJ7RnZ3Snp7MmpvDk5O5jI6r' , String crlf ,
'  hIScfXuBaGZOPDonHBs1MTJCQkQZGB4dHCElIyYnIyQpHx42KCVPPDZgSENbQztRNi1UNy9rSkV0' , String crlf ,
'  TUprPT9yP0NwP0JqR0NXOTFMKSODV1S+honOjZHTjJLfmJzenZ/NkpC7gX+pcm+qcG6veHOyfXmr' , String crlf ,
'  dnCbYV2NU0+bYVuzfHe9iITAjovCkpC6jYy1iYipgn+feXaTdHGMcG1nUk8xISErICJKR01XWF0W' , String crlf ,
'  FxwYGR4eHSIiHiEkGxwtIiBAMSxOOzRWPjZdQDhwTUeNZGChcXGOWlx3PkR9SUtsRUJTNS1HJh9Q' , String crlf ,
'  KSRvPTyOU1WeXV+pa2ybZWN7S0dkNDBuPzmQXFqodXGwgHymd3GWZWCFVE+CT0mTYFqicWqneHKl' , String crlf ,
'  eXageXSUbmmKaWR+YFqBZWF4Y15KOjgiGBc4NDdeXWNoa3IQExoVFhscGyAfHSAhGx0rISBBMS9V' , String crlf ,
'  QDtbPztoR0KDXFekd3S8iIi6f4OUVV2CR0uNXV10TUhpQz5hOzZZMCxSJiNSJiNOJyI+IBg8HxdA' , String crlf ,
'  IhpbODCCVlOYa2ahdHGRZWJ7VE90TUZySkJ8UUiIXVSQZVyMZl2FX1h1UkprTUVvVE15ZF9ZSUcq' , String crlf ,
'  IiAkIiVQUVZtcHdzeH4VGB8VFhsVFhocGh0lHyExJyZCNDFUPzpeQj50UU2VaWa0goHEjI3Pk5W+' , String crlf ,
'  fYOXWV6CR0mPXVySZmN8VVBuR0JaNC9LKCI9IBg4IRk7JxxDLCRUNy9wSkeAWVR8VlNjQDxSNC5X' , String crlf ,
'  OTFsSUFzUUd2UUZ/Wk95V01mSD5eQTdjS0FsV1FjUk08MjE8OjtVWF9udX2Gi5GJjpQeHyQaGyAZ' , String crlf ,
'  Gh4dHR8lISIuJiQ+MC1PPDZeQD19V1Sfcm+5hYPLkJLWmJvYl52/fIOfWF6MS0+VX1+OXlyHW1p6' , String crlf ,
'  U1BiPztPMStDKiU/KCBFLCdJLCZVMzFZOzVPMy8/JiE6Ih1BKiJlSkFzV0t0V0t2Wk5qUENdRTli' , String crlf ,
'  S0FmVEpfUElMQT1IQkJkZWltdH5xeoOJjZaTlp0iIygiIygfICQeHiAeHB0kHxw2KydLOjNdQT14' , String crlf ,
'  VVGbb2ywfHrDi4zTl5nbnaLVkpnJfISuY2qSUVWCR0mOWFqJV1h1REdmPD1aNjVLKSdHJSNCIB5I' , String crlf ,
'  JiRKLCk9JB8wGxUqFxAzHxZYQTdvWExvV0tlTkJaRjteTkNfUEhOQTk6MCktJSIuKi01Njs4P0lL' , String crlf ,
'  VF1scHmGiZAuLTMrKjAlJioiJCUkJCQnJiIzKyhCMy5XPjp0U06cc2+vf32zf32+hoXHj5DPkZTU' , String crlf ,
'  h4/Ofoe5bnekW2ScU1yNRE2DO0Z2ND1pMDZeKy9dLzFZLzBdNTVZNzVIKic0HBctGRA1IRZVQTZq' , String crlf ,
'  VktdS0FKOTFIOzNNQz8+NjMoIB0aEhAYEhIZFRgUExkSFB4WGiMlKjBGS1EgHyUiISYhIiYhIyQi' , String crlf ,
'  JCMiIx4pJCA3KiROOTRxVE6Zcm+zhoOygH2rd3Wtd3e5foDEfYPCd37Ge4S/dH2+bnm8bHeyYW+l' , String crlf ,
'  WWWXU12MT1aJUleIV1qGWVt1Tk5aOzg/Jx83IBg7JxxUQDVgTkRBMisrIRoxKSYoJCMaGBkWFBUY' , String crlf ,
'  FBUaFhcaFhkWExkZGiESFRwUGR8wOD0RDhQREBUPEBQPERIcHh0eHxojHhozKCRNOjRrUEmRa2ix' , String crlf ,
'  hYK4iISufHmfa2mcZmaeYmSlZ2yvcXazcHe7dHy8c3y8cXq5cHmua3Kna2+kbG+da2yPY2KAWldl' , String crlf ,
'  R0FILSY+Jx9LNy5TQTdBMismGxcaEhAVExQTFBgXGBwYFxwaGBscGBkcGBsZFxoZFhwXGB0aHSQ6' , String crlf ,
'  P0UMCQ8NCw4MDA4LDQwUFhMdHhkmIR40KSVKNzFrT0uLaGSthIC+joy5hYOqdnSaZGSHUVOEUFKM' , String crlf ,
'  VliQWlyZXmKlZ2yxcHaycXevcXarcHSjbW+ZZ2iOZWN+W1dgRT5ELSU/LCVGNS08LSYpHBYZEQ4P' , String crlf ,
'  CwoNDhIVGB0XGh8XGh4bGx0bGRwbGRobGRwaFx0ZGB4fIik/REoRDxIQDg8ODg4MDAwPDw0aGRUj' , String crlf ,
'  HhssIR1NOjZtUU2EYV2nfnq8jIq9iYm6goOlb2+SYGF7TU9vQ0J1SUh3S0iBUU+OXFuVX1+TXV2W' , String crlf ,
'  YGCUYmOUZ2aPaGhzV1NOOzQ5LCM2LCUzKCQiGBQUDAkPCgcLCQoLDxAWGx4XHB8YGx8aHB0aGhoa' , String crlf ,
'  GhoaGhwYGR0YGR4ZGiEoKzIZFxgZFxgVExQSEhIRDw4XFhIbFhMkGRVDMi1fRkJ5V1WgeXa2hoS2' , String crlf ,
'  goKzfX2ha2uOYGJ4Tk9vRkR8VVJ9VFB6Tkt6TUp8TEqIVlWUYmGYa2qUbGyCY2BeSUQ9MCgvKCAk' , String crlf ,
'  HxsZFBESDQoOCwcJBwYNDQ0TFxgVGh0XHB8XGxwZGxoYGhkaGhoZGxwXGh8WGR4WGR4YGR4cGBcf' , String crlf ,
'  GxocGBcYFhUYFBMZFhIZFBEkGhZGNzJXPztrTUqLaGSfc3CoeHaseHindXSPYmSDWVp+UlGGWViL' , String crlf ,
'  W1mPXVyTX12aZmSfbWymeXaheneGZGJiSUVFNC8wJSElHRoUEw8ICAYJBwYLCQgGBgQQEBAZHR4X' , String crlf ,
'  GxwZHR4YHB0ZGxoaGhoaHBsbHR4XHCAWGx8VGB0RFBgdGRggHBsgHBseGhkcGBcaFRIZFBAoHho2' , String crlf ,
'  KCVHNC5gR0J5W1WHYV6Ua2efb22gc3CFXlt+V1SBVVSKXVqVY2KdaWmkcG6xf3ywg4Cke3mMamho' , String crlf ,
'  T0tFNC8yJCElGxkYExAMDAoHCQgICAYJCQcKCgoTExMbHR4YHB0ZHR4aHB0aGhoaGhocHB4ZHCAX' , String crlf ,
'  HCAWGx8UFxsUFxsjHhsgGxghHBkgGxgeGRYbFhMbFhIiGhUnHRk2KSFPPDVlTkZxU01/XFiJYFyM' , String crlf ,
'  ZWB2U09rSkV5U1CHXlqUZ2Scb2qjdnGyhoGkfXiKZ2NpTUlMOTU0KSUlHRsYFBMPDQwICAgICgkJ' , String crlf ,
'  CQcLCQgREREYGBgaHB0ZGh4bHCAZGxwZGRkaGhobGx0aGx8WGR4TGBwVFhoWGBkkHh4bFxYdGhYd' , String crlf ,
'  GhYfGhceGRYdGBUaFREiGhUmHRY3KiJOPTVbQz5pTEZtT0lsTkhhQ0BbPTpwUkx6V1N/WFOFXlmL' , String crlf ,
'  ZF+Sb2mDYl1sUExLODIwJSEhGRcXExIQDg8NDQ0ICAgGBgYICAgMDAwTExMZGxwcHSEYGR0bHCAZ' , String crlf ,
'  Gh4ZGRsZGRkaGhwZGh4UFxwSFRoUFRkXFxkfGx4WFBUWFBMbGhYcGRUbFhMdFRMZFBEZFhIdGBQo' , String crlf ,
'  IBs6MClGNS5HNC5OOTRPNzNGMSxKMi5dREBjR0NlR0FtT0loSkdhSERYQDtHNi8wJiQgGxgVERAN' , String crlf ,
'  CwoJCQkJCQkIBgUIBgcLCwsTFRYWGhsXGh4aGx8ZGh4ZGh4WFxsYGhsZGxwYGR0UFxsSExcTFBgW' , String crlf ,
'  GBkUFhceGyEVExYSEhIXFhIZFhIZFBAcExQYEhIXFBAWFRAcFxMoIRkuIRsvIBk4JyI5KCM7KCQ8' , String crlf ,
'  KSVONjRSOTVXOzdeQj5QODRFMi48KSMuIRsdGBUSEA8ODAsMCgkKCgoKCgoNCQgMCgkPDxEVGRoY' , String crlf ,
'  Gx8WGx4ZGh4XGBwYGR0WFxsWGhsXGxwWGR0UFxsTFBgTFBgVFxgTFRYADAEAAAMAAAABADIAAAEB' , String crlf ,
'  AAMAAAABADIAAAECAAMAAAADAAAd6gEDAAMAAAABAAEAAAEGAAMAAAABAAIAAAERAAQAAAABAAAA' , String crlf ,
'  CAESAAMAAAABAAEAAAEVAAMAAAABAAMAAAEXAAQAAAABAAAdTAEcAAMAAAABAAEAAAFTAAMAAAAD' , String crlf ,
'  AAAd8IdzAAcAAA3oAAAd9gAAAAAACAAIAAgAAQABAAEAAA3oYXBwbAIAAABtbnRyUkdCIFhZWiAH' , String crlf ,
'  1QAGAAcADwAGADBhY3NwQVBQTAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA9tYAAQAAAADTLWFw' , String crlf ,
'  cGw+yfSajeQseR3F2zzMGI+PAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA5yWFlaAAAB' , String crlf ,
'  LAAAABRnWFlaAAABQAAAABRiWFlaAAABVAAAABR3dHB0AAABaAAAABRjaGFkAAABfAAAACxyVFJD' , String crlf ,
'  AAABqAAAAA5nVFJDAAABuAAAAA5iVFJDAAAByAAAAA52Y2d0AAAB2AAAAxJuZGluAAAE7AAABj5k' , String crlf ,
'  ZXNjAAALLAAAAGRkc2NtAAALkAAAAf5tbW9kAAANkAAAAChjcHJ0AAANuAAAAC1YWVogAAAAAAAA' , String crlf ,
'  ZC4AADctAAADGVhZWiAAAAAAAABrfwAAsIgAAB8SWFlaIAAAAAAAACcoAAAYZgAAsPlYWVogAAAA' , String crlf ,
'  AAAA81IAAQAAAAEWz3NmMzIAAAAAAAEMQgAABd7///MmAAAHkgAA/ZH///ui///9owAAA9wAAMBs' , String crlf ,
'  Y3VydgAAAAAAAAABAc0AAGN1cnYAAAAAAAAAAQHNAABjdXJ2AAAAAAAAAAEBzQAAdmNndAAAAAAA' , String crlf ,
'  AAAAAAMBAAABAAYJDA8RExUXGBocHR8gISMkJScoKSorLC0uLzAxMjMzNDU3ODg5Ojs9Pj9AQUJC' , String crlf ,
'  Q0RERUZHR0hJSktLTE1OT1BQUVJTU1RVVldXWFlaW1tcXF1eX2BhYmJjZGVmZ2hoaWprbG1ub3Bx' , String crlf ,
'  cnN0dXZ3eHl7fH1+f4CCgoOEhYaGh4iJioqLjI2Ojo+QkJGSk5OUlZaXl5iZmpqbnJ2dnp+goKGi' , String crlf ,
'  o6Skpaamp6ipqqqrrK2urq+wsbGys7S0tba3uLm5uru8vb6+v8DBwsPExcXGx8jJysvMzc3Oz9DR' , String crlf ,
'  0tPU1dbX2Nna2tvc3d7e3+Di4uPk5ebn6Onq6+3u8PHz9ff6/wAFCAsNDxETFRYYGRscHh8hIiMk' , String crlf ,
'  JicoKSorLC0uLzAxMTIzNTY2Nzk6Ozw9Pj9AQEFCQ0RERUZHSElKSktMTU5OT1BRUVJTVFVVVldY' , String crlf ,
'  WVlaW1tcXV1eX2BhYWJjZGVmZ2hpaWprbG1ub3BxcnN0dXZ3eHl6fH1+gIGCg4OEhYaHh4iJiouL' , String crlf ,
'  jI2Oj4+QkZKSk5SVlpeXmJmZmpucnZ2en5+goaKjpKSlpqanqKmqqqusra6ur7CxsrKztLW2t7e4' , String crlf ,
'  ubq7vLy9vr/AwcLDxMTFxsfIycrLy8zNzs/Q0dPT1NXW19jZ2tvb3N3e3+Dh4uPk5ebn6Onq6+3u' , String crlf ,
'  7/Hy9Pb4+v8ABgkMDhARExQWFxgaGxwdHh8gISIjJCUlJiYnKCkpKiorLC4vLzAxMjM0NTY3ODg5' , String crlf ,
'  Ojs8PD0+P0BBQkJDQ0RFRkdHSElJSktLTE1OTk9QUFFRUlNTVFVWV1hYWVlaW1tcXV5eX2BhYmJj' , String crlf ,
'  ZGVlZmdoaWlqa2xtbnBxcnN0dXZ3eHl6e3x9fn+AgYKDhISFhoeIiYqLi4yNjo6PkJGSkpOUlZWW' , String crlf ,
'  l5iZmpqbnJ2enp+goaKjo6SlpqenqKmqq6ytra6vsLGysrO0tra3uLm6u7y9vr/AwcLDxMXGx8jJ' , String crlf ,
'  ysvMzc7P0NLT1dXW19jZ2tzd3t/g4eLk5efp6uzu8PL09/r/AABuZGluAAAAAAAABjYAAJ++AABZ' , String crlf ,
'  FgAAUakAAI6XAAAnjQAAFqgAAFANAABUOQAB1woAAdHrAAGMzAADAQAAAgAAAAAAAAABAAEAAgAD' , String crlf ,
'  AAUACAALAA4AEgAWABsAIAAlAC4ANwBCAE0AWQBlAHMAgQCfALAAwQDSAOUBCwEgATUBYQGQAagB' , String crlf ,
'  wQH1AisCRwJkAp8C3AMcA18DgQPqBDQEfwTNBR0FcAXEBnQGzwb+By0HjAhSCLgJIAlUCYoJ9gpk' , String crlf ,
'  CtULRwu8DKsNJg4hDqEPJBAvELgRQxHPEu4TgBQVFKsVQxZ5FxcXthj8GaEaSBrxHEkc+B2oHlsf' , String crlf ,
'  xSE3IfIisCNvJDAk8yZ+J0YoECjcKakqeSwcLPEtxy6gL3kwVTEzMhIy8zPVNLk1oDaHN3E4XDlJ' , String crlf ,
'  Ojg6sDsoPBo9Dj4DPvs/9EBxQO5C6EPoROlF7Ef3SP9KCUsUTTBOQE9SUGZSklOrVeFW/1geWmFb' , String crlf ,
'  hVyrXdJgJWFSYn9k4GYSZ0dptGrtbChuom/hcSJyZXTvdjZ4yXoVe2N8sn9VgKmB/4NWhgmHZYjC' , String crlf ,
'  i4GM445HkRKSe5PklVCWvJmbmwycf530n2qiWqMXpVGmz6hOqc6rUa5ar+CxabLytH62C7eZuSm8' , String crlf ,
'  Tb3hv3fBDsHaxEHF3cd7yRnKusxbzf/Po9Lx1JvWRdfx207c/93Y3rHiGePQ5YjnQej86rnsdu42' , String crlf ,
'  7/fw1/G583z0X/VC9wj37PjQ+bX6mvt//GX8/v2X/jH+jf7q/0b/o///AAAAAAABAAEAAgADAAUA' , String crlf ,
'  CAALAA4AEgAWAB0AJQAuADcAQgBNAFkAZQBzAIEAnwCwAMEA5QD4AQsBNQFLAWEBkAGoAcEB9QIr' , String crlf ,
'  AmQCgQKfAtwDHANfA4ED6gQ0BH8EzQUdBXAFxAZ0Bs8G/gctB4wIUgiECLgJIAmKCfYKZArVC0cL' , String crlf ,
'  vAyrDSYNog4hDyQPqRAvELgRQxHPEu4TgBQVFKsV3RZ5FxcYWBj8GaEaSBucHEkc+B2oHw8fxSE3' , String crlf ,
'  IfIjbyQwJPMltydGKBAo3CmpKnkrSiwcLPEuoC95MFUxMzISMvMz1TS5NaA2hzdxOFw5STo4Oyg8' , String crlf ,
'  Gj0OPYg+Az77P/RAcUDuQepC6EPoRexG8Uf3SP9LFEwhTTBOQFBmUXtSklOrVeFW/1geWmFbhVyr' , String crlf ,
'  XdJe+2FSYn9k4GYSZ0dofGrtbChuom/hcSJyZXOpdjZ3f3oVe2N8sn4DgKmB/4NWhK+HZYjCiiGL' , String crlf ,
'  gY5Hj6yREpJ7k+SWvJgrmZubDJx/n2qg4aJao9WlUabPqE6pzqzUrlqv4LFpsvK0frYLuSm6urxN' , String crlf ,
'  veG/d8EOwdrCp8Xdx3vJGcq6zFvN/8+j0UrUm9ZF1/HZn9tO3P/eseBk4hnj0OWI50Ho/Oq57Hbu' , String crlf ,
'  Nu8W7/fxufN89F/1QvcI9+z40Pm1+pr7f/xl/Uv+Mf6N/ur/Rv+j//8AAAAAAAAAAQABAAIAAwAF' , String crlf ,
'  AAgACwAOABIAFgAdACUALgA3AE0AWQBlAIEAkACfAMEA5QD4AQsBNQFhAZABwQH1AisCZAKfAtwD' , String crlf ,
'  HANfA+oEfwTNBR0FxAZ0Bs8G/gctB4wIUgi4CSAJign2CmQK1QtHC7wMqw0mDaIOIQ8kD6kQLxC4' , String crlf ,
'  EUMRzxLuFBUUqxVDFd0XFxe2GPwZoRrxG5wcSR2oHlsfxSE3IfIjbyQwJPMltyZ+KBApqSp5LBws' , String crlf ,
'  8S3HL3kwVTEzMhIz1TS5NaA3cThcOUk6ODwaPQ4+Az77P/RAcUDuQepC6EPoROlF7EbxR/dI/0oJ' , String crlf ,
'  SxRMIU0wTkBPUlBmUXtSklOrVMVV4VgeWT9aYVuFXKtd0l77YVJif2OvZhJnR2h8abRsKG1kbqJx' , String crlf ,
'  InHDc6l073Y2eMl6FXtjfLJ/VYCpgf+DVoSvh2WIwoohi4GOR4+skRKSe5PklVCYK5mbmwycf530' , String crlf ,
'  oOGiWqMXo9Wmz6hOqc6rUazUrlqv4LFpsvK0frYLt5m5Kbq6vE294b93wQ7Cp8RBxd3He8kZyrrM' , String crlf ,
'  W83/ztHPo9FK0h3S8dZF1/HZn9tO3P/d2N6x4GTiGePQ5YjnQej86drquex27VbuNu8W7/fxufKa' , String crlf ,
'  83z0X/VC9iX3CPfs+ND5tfqa+zP7zPxl/P79l/4x/o3+6v9G/6P//wAAZGVzYwAAAAAAAAAKQ29s' , String crlf ,
'  b3IgTENEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA' , String crlf ,
'  AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAG1sdWMAAAAAAAAADwAAAAxpdElUAAAAFAAAAMRm' , String crlf ,
'  ckZSAAAAQgAAANhuYk5PAAAAEgAAARplc0VTAAAAEgAAASxmaUZJAAAAEAAAAT5wdFBUAAAAGAAA' , String crlf ,
'  AU56aFRXAAAADgAAAWZqYUpQAAAADgAAAXRubE5MAAAAFgAAAYJkZURFAAAAEAAAAZhrb0tSAAAA' , String crlf ,
'  DAAAAahlblVTAAAAEgAAAbRzdlNFAAAAEAAAAcZkYURLAAAAHAAAAdZ6aENOAAAADAAAAfIATABD' , String crlf ,
'  AEQAIABjAG8AbABvAHIAaQDJAGMAcgBhAG4AIADgACAAYwByAGkAcwB0AGEAdQB4ACAAbABpAHEA' , String crlf ,
'  dQBpAGQAZQBzACAAYwBvAHUAbABlAHUAcgBGAGEAcgBnAGUALQBMAEMARABMAEMARAAgAGMAbwBs' , String crlf ,
'  AG8AcgBWAOQAcgBpAC0ATABDAEQATABDAEQAIABjAG8AbABvAHIAaQBkAG9faYJybbJmdphveTpW' , String crlf ,
'  aDCrMOkw/AAgAEwAQwBEAEsAbABlAHUAcgBlAG4ALQBMAEMARABGAGEAcgBiAC0ATABDAETO7Lfs' , String crlf ,
'  ACAATABDAEQAQwBvAGwAbwByACAATABDAEQARgDkAHIAZwAtAEwAQwBEAEwAQwBEAC0AZgBhAHIA' , String crlf ,
'  dgBlAHMAawDmAHIAbV9pgnIAIABMAEMARAAAbW1vZAAAAAAAAAYQAACcNQAAAAC6N+AAAAAAAAAA' , String crlf ,
'  AAAAAAAAAAAAAHRleHQAAAAAQ29weXJpZ2h0IEFwcGxlIENvbXB1dGVyLCBJbmMuLCAyMDA1AAAA' , String crlf ,
'  AA==' , String crlf ,
'X-ABUID:F0A8286E-0B5C-11D8-8904-000A95DB7844\:ABPerson' , String crlf ,
'END:VCARD' , String crlf
]

{ #category : #'fixtures-exporting' }
ICVCardTest >> aviCardStringExport [
^
'BEGIN:VCARD' , String crlf ,
'VERSION:3.0' , String crlf ,
'N:Bryant;Avi;;;' , String crlf ,
'FN:Avi Bryant' , String crlf ,
'ADR;TYPE=home;TYPE=pref:;;xxx E. xx Ave;Vancouver;BC;V5V 1E3;Canada' , String crlf ,
'TEL;TYPE=home;TYPE=pref:(778) xxx-xxxx' , String crlf ,
'EMAIL;TYPE=internet;TYPE=pref;TYPE=work:avi@smallthought.com' , String crlf ,
'EMAIL;TYPE=home;TYPE=internet:avi.bryant@gmail.com' , String crlf ,
'TZ:-05:00' , String crlf ,
'X-AIM;TYPE=pref:avbry' , String crlf ,
'X-MSN;TYPE=pref:avi666@hotmail.com' , String crlf ,
'END:VCARD' , String crlf
]

{ #category : #'fixtures-parsing' }
ICVCardTest >> donaldCardString [
^'begin:vcard
fn:Donald Major
n:Major;Donald
org:SAS Institute Inc.;ERV
adr:100 SAS Campus Drive;;R2424;Cary;NC;27513;United States of America
email;internet:Donald.Major@sas.com
title:Systems Developer
tel;work:677-8000 x16937
url:http://www.sas.com
version:2.1
end:vcard' , String crlf
]

{ #category : #'fixtures-parsing' }
ICVCardTest >> ericCardString [
^
'BEGIN:VCARD' , String crlf ,
'VERSION:3.0' , String crlf ,
'N:Wahlforss;Eric;;;' , String crlf ,
'FN:Eric Wahlforss' , String crlf ,
'TITLE:Entrepreneur / Musician' , String crlf ,
'EMAIL;type=INTERNET;type=WORK;type=pref:eric at wahlforss.com' , String crlf ,
'item1.EMAIL;type=INTERNET:eric at forss.to' , String crlf ,
'item1.X-ABLabel:_$!<Other>!$_' , String crlf ,
'TEL;type=CELL;type=pref:+46703639900' , String crlf ,
'item2.TEL:+491793126620' , String crlf ,
'item2.X-ABLabel:_$!<Other>!$_' , String crlf ,
'item3.ADR;type=HOME;type=pref:;;Tavastgatan 6;Stockholm;;11820;Sweden' , String crlf ,
'item3.X-ABADR:se' , String crlf ,
'URL:http://eric.wahlforss.com/' , String crlf ,
'X-AIM;type=HOME;type=pref:ericwahlforss' , String crlf ,
'X-MSN;type=HOME:ericwahlforss@hotmail.com' , String crlf ,
'X-ICQ;type=WORK;type=pref:5399905' , String crlf ,
'CATEGORY:24HDC' , String crlf ,
'END:VCARD' , String crlf
]

{ #category : #'fixtures-parsing' }
ICVCardTest >> goofyCardString [
^'BEGIN:VCARD' , String crlf ,
'VERSION:2.1' , String crlf ,
'FN;CHARSET=ISO-8859-1:Markus Tschannen' , String crlf ,
'N;CHARSET=ISO-8859-1:Tschannen;Markus;;;'  , String crlf ,
'ADR;TYPE=HOME;CHARSET=ISO-8859-1:;;Neufeldstrasse 11;Bern;;3012;Schweiz' , String crlf ,
'TEL;TYPE=VOICE,HOME;CHARSET=ISO-8859-1:+41 31 302 08 56' , String crlf ,
'TEL;TYPE=CELL,HOME;CHARSET=ISO-8859-1:+41 78 845 24 12' , String crlf ,
'BDAY:1980-10-30' , String crlf ,
'TZ;VALUE=text:-05:00; EST; Raleigh/North America' , String crlf ,
'GEO:37.386013;-122.082932' , String crlf ,
'END:VCARD' , String crlf
]

{ #category : #'fixtures-exporting' }
ICVCardTest >> goofyCardStringExport [
^'BEGIN:VCARD' , String crlf ,
'VERSION:2.1' , String crlf ,
'N:Tschannen;Markus;;;'  , String crlf ,
'FN:Markus Tschannen' , String crlf ,
'BDAY:1980-10-30' , String crlf ,
'ADR;TYPE=home:;;Neufeldstrasse 11;Bern;;3012;Schweiz' , String crlf ,
'TEL;TYPE=home;TYPE=voice:+41 31 302 08 56' , String crlf ,
'TEL;TYPE=cell;TYPE=home:+41 78 845 24 12' , String crlf ,
'TZ;VALUE=TEXT:-05:00\\; EST\\; Raleigh/North America' , String crlf ,
'GEO:37.386013;-122.082932' , String crlf ,
'END:VCARD' , String crlf
]

{ #category : #'fixtures-parsing' }
ICVCardTest >> josephCardString [
^
'begin:vcard' , String crlf ,
'n:THOMAS;JOSEPH' , String crlf ,
'tel;home:3790977' , String crlf ,
'tel;work:2349961,2349972,2349986 EXT:7089' , String crlf ,
'x-mozilla-html:FALSE' , String crlf ,
'url:www.alcatel.com' , String crlf ,
'org:ADCC;VI-32' , String crlf ,
'version:2.1' , String crlf ,
'email;internet:Thomas.Joseph@adcc.alcatel.be' , String crlf ,
'title:SOFTWARE ENGINEER' , String crlf ,
'adr;quoted-printable:;;94/95,Thiru-Vi-Ka Industrial Estate,=0D=0AGuindy,=0D=0A;Chennai;Tamil Nadu;600032;India' , String crlf ,
'note;quoted-printable:=0D=0A=0D=0A=0D=0A=0D=0A=0D=0AMake Life a Meaningful Journey.......=0D=0A=0D=0A' , String crlf ,
'fn:JOSEPH' , String crlf ,
'end:vcard' , String crlf
]

{ #category : #'fixtures-parsing' }
ICVCardTest >> maeveCardString [
^
'BEGIN:VCARD' , String crlf ,
'VERSION:3.0' , String crlf ,
'N:Price;Maeve;;;' , String crlf ,
'FN:Maeve Price' , String crlf ,
'TITLE:Digital Editor' , String crlf ,
'EMAIL;type=INTERNET;type=WORK;type=pref:maeve@zenediting.com' , String crlf ,
'EMAIL;type=INTERNET;type=WORK:maeve.price@myoasis.colum.edu' , String crlf ,
'EMAIL;type=INTERNET;type=HOME:mahaevey@aol.com' , String crlf ,
'TEL;type=CELL;type=pref:312-505-9563' , String crlf ,
'item1.ADR;type=HOME;type=pref:;;1636 W. Pierce Ave #1;Chicago;IL;60622;USA' , String crlf ,
'item1.X-ABADR:us' , String crlf ,
'item2.URL;type=pref:http\://www.zenediting.com' , String crlf ,
'item2.X-ABLabel:_$!<HomePage>!$_' , String crlf ,
'item3.URL:http\://www.myspace.com/maeveprice' , String crlf ,
'item3.X-ABLabel:my space' , String crlf ,
'BDAY;value=date:2005-06-14' , String crlf ,
'X-AIM;type=HOME;type=pref:Mahaevey' , String crlf ,
'X-MSN;type=HOME;type=pref:dgu186@hotmail.com' , String crlf ,
'CATEGORIES:Friends,Columbia College Chicago,Family' , String crlf ,
'X-ABUID:032C4F53-35BA-490E-8C25-5DBA59230358\:ABPerson' , String crlf ,
'END:VCARD' , String crlf
]

{ #category : #'fixtures-parsing' }
ICVCardTest >> oscarCardString [
^'BEGIN:VCARD' , String crlf ,
'VERSION:3.0' , String crlf ,
'N:Nierstrasz;Oscar;;;' , String crlf ,
'FN:Oscar2 Nierstrasz' , String crlf ,
'ORG:University of Bern;' , String crlf ,
'TITLE:Professor' , String crlf ,
'EMAIL;type=INTERNET;type=WORK;type=pref:oscar.nierstrasz@acm.org' , String crlf ,
'TEL;type=WORK;type=pref:+41 31 631.4618' , String crlf ,
'TEL;type=HOME:+41 31 961.7065' , String crlf ,
'TEL;type=WORK;type=FAX:+41 31 631.3355' , String crlf ,
'item1.ADR;type=WORK;type=pref:;;Software Composition Group\nIAM\, University of Bern\nNeubrueckstrasse 10;Bern;;CH-3012;SWITZERLAND' , String crlf ,
'item1.X-ABADR:us' , String crlf ,
'item2.ADR;type=HOME:;;Fluhmattweg 41;Kehrsatz;;3122;SWITZERLAND' , String crlf ,
'item2.X-ABADR:us' , String crlf ,
'item3.ADR;type=HOME:;;Schuetzenmattstrasse 14\, room 103;;;;' , String crlf ,
'item3.X-ABLabel:express' , String crlf ,
'item3.X-ABADR:us' , String crlf ,
'URL:http://www.iam.unibe.ch/~oscar/' , String crlf ,
'END:VCARD' , String crlf
]

{ #category : #'fixtures-parsing' }
ICVCardTest >> philippeCardString [
	^
'BEGIN:VCARD' , String crlf ,
'VERSION:2.1' , String crlf ,
'N;ENCODING=QUOTED-PRINTABLE:Marschall;Philippe' , String crlf ,
'FN:Philippe Marschall' , String crlf ,
'NICKNAME;ENCODING=QUOTED-PRINTABLE:pmm' , String crlf ,
'ADR;HOME;ENCODING=QUOTED-PRINTABLE:;;Poststrasse 1;Z=FCrich;;8001;' , String crlf ,
'EMAIL;INTERNET:philippe.marschall@gmail.com' , String crlf ,
'END:VCARD' , String crlf
]

{ #category : #'fixtures-parsing' }
ICVCardTest >> seanCardString [
^
'BEGIN:VCARD' , String crlf ,
'VERSION:2.1' , String crlf ,
'X-PLAXO-VERSION:1.0' , String crlf ,
'N:Glazier;Sean;;;' , String crlf ,
'FN:Sean Glazier' , String crlf ,
'ORG:Cincom Systems' , String crlf ,
'TITLE:Lead Software Engineer' , String crlf ,
'ADR;WORK;ENCODING=QUOTED-PRINTABLE:;;6 Christie Lane;Stratham;NH;03885;USA' , String crlf ,
'TEL;WORK;VOICE:603 772 4480' , String crlf ,
'TEL;CELL;VOICE:603 770 8260' , String crlf ,
'EMAIL;PREF;INTERNET;WORK:sglazier@comcast.net' , String crlf ,
'X-AIM;WORK:Visualwave' , String crlf ,
'ADR;HOME;ENCODING=QUOTED-PRINTABLE:;;6 Christie Lane;Stratham;NH;03885;USA' , String crlf ,
'TEL;HOME;VOICE:603 772 2852' , String crlf ,
'TEL;CELL;VOICE:603 770 8260' , String crlf ,
'EMAIL;INTERNET;HOME:sglazier@comcast.net' , String crlf ,
'X-AIM;HOME:Visualwave' , String crlf ,
'BDAY:2005-10-01' , String crlf ,
'END:VCARD' , String crlf
]

{ #category : #'fixtures-parsing' }
ICVCardTest >> surendarCardString [
^
'BEGIN:VCARD' , String crlf ,
'VERSION:3.0' , String crlf,
'N:Chandra;Surendar;;;' , String crlf,
'FN:Surendar Chandra' , String crlf,
'ORG:Univ. of Notre Dame;Computer Science and Engg' , String crlf,
'TITLE:Asst. Professor' , String crlf,
'EMAIL;type=INTERNET;type=WORK:surendar@nd.edu' , String crlf,
'item1.EMAIL;type=INTERNET;type=pref:surendar@acm.org' , String crlf,
'item1.X-ABLabel:_$!<Other>!$_' , String crlf,
'item2.EMAIL;type=INTERNET:surendar@cs.duke.edu' , String crlf,
'item2.X-ABLabel:_$!<Other>!$_' , String crlf,
'TEL;type=WORK:5746318975' , String crlf,
'TEL;type=HOME;type=pref:5742773801' , String crlf,
'TEL;type=CELL:5743869632' , String crlf,
'TEL;type=WORK;type=FAX:5746319260' , String crlf,
'item3.TEL:(574) 631-5772' , String crlf,
'item3.X-ABLabel:lab' , String crlf,
'item4.TEL:(574) 386-1404' , String crlf,
'item4.X-ABLabel:norma''s cell' , String crlf,
'item5.ADR;type=WORK:;;384 Fitzpatrick Hall;Notre Dame;IN;46556;USA' , String crlf,
'item5.X-ABADR:us' , String crlf,
'item6.ADR;type=HOME;type=pref:;;14840 Cranford Ct;Granger;IN;46530;USA' , String crlf,
'item6.X-ABADR:us' , String crlf,
'NOTE:SMS message\n12/22/2003 18:12\nwassup\n\nSMS message\n12/23/2003 13:12\nHello' , String crlf,
'URL:http://www.cse.nd.edu/~surendar/' , String crlf,
'BDAY;value=date:1967-02-24' , String crlf,
'X-AIM;type=HOME;type=pref:surendar' , String crlf,
'X-MSN;type=HOME;type=pref:surendar' , String crlf,
'X-YAHOO;type=WORK;type=pref:surendarcsdukeedu' , String crlf,
'PHOTO;BASE64:' , String crlf,
'  /9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEB' , String crlf,
'  AQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/2wBDAQEBAQEBAQEBAQEBAQEBAQEBAQEB' , String crlf,
'  AQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/wAARCAA8ADwDASIA' , String crlf,
'  AhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA' , String crlf,
'  AAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3' , String crlf,
'  ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm' , String crlf,
'  p6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA' , String crlf,
'  AwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx' , String crlf,
'  BhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK' , String crlf,
'  U1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3' , String crlf,
'  uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD+/ivN' , String crlf,
'  Pij8QfAPwd+H3jn4s/FDxJpvhH4efDzw5rvjPxn4l1YyyWOj6BoWnXF/ql9LDFDc3V20NjaOIdNs' , String crlf,
'  YJ72+uFhtbG3ubyS1hr0uv5CP+Dxj9oL4p/Cj9gz4MfCrwJqM+jeEPj98cJdI+Kd7Z3rW1zq3h/w' , String crlf,
'  LoSeKNH8J3USNGbnRtW8QNZavqAeRES48M6cs2+DcspeUbuLs7aC5VJpNX1/U/Lr/goz/wAHXXxs' , String crlf,
'  8Z6/4h8DfsJ6Fp/wc+FqzXVtZfGHxLptv4g+MXiSxhR7c3mn6bqUmoaB4Gn1GVnFtZ22n6trtlCP' , String crlf,
'  Mm8R6bNG8I/mr+K/7fH7ZfxpkPibxz8f/jD4wv5vPuLW+8TfFjxnql3DLtLzSQwNqTQWAdy8kFvb' , String crlf,
'  G2giG1LeOONVUch8FfgtZ/EqLwDDrFs8SeMPFugeGWnUmNUsdQsrnU4jcMu7Mt+sTKdnzsQ4XJUk' , String crlf,
'  frZ8Zf2N/BXwp1eS30v4fXFpbWnh7wzdWVhb2G+xnu4L6HTZAXmUzeXPJqcIuLiUAbVR5NpcZ+Ix' , String crlf,
'  /FeCw+Nhh4zdeu3V5qlStGlh4ug1zQUZN803rFaaNN6H32VcC5ljsBUxnIqNCP1aMadOnKpiJPEx' , String crlf,
'  b51FLWEUk32Tet3Y+XP2I/8AguD/AMFEv2MZ9Qs9P+MepfGX4aXsLxSfDv42X2t+NtC0K7gJmD6F' , String crlf,
'  Nc6pa67ocMiRuzw6NrVpbXLo095HMFdT/ZR/wRr/AOC0Mf8AwU11P4g/DX4heFPCvgT4seCdBj8Y' , String crlf,
'  WGm6Df3MUPiLQRf2umavLY6fql3JOZrC6urG5uJNKW7CWsjzXBSNtx/hS/ah+BqfCfQdX8UX2jYX' , String crlf,
'  VhY3FvbaXIsaaTeXSCIWm4DypJI5Gt4Lt87JpXuNgIbFfP8A+yB+0b4r/Zh/a5/Zu/aD+Gt7Pa6r' , String crlf,
'  8N/iT4c1HULK2ubq2j1bSbjVLTRvE/hjVTZvBLcaN4o0K5vdH1WyIWObT5rpZWkeOCevqeHs+/tO' , String crlf,
'  lTxuGrT+qxrKlVp83ucyhSlJK927ObTezaWivr8pn2R1MlxLwWKio1nTVRaWbjKc4xeu14wUnu05' , String crlf,
'  O6P9t3wr/wAiv4b5Lf8AEh0fkkEn/iX2/JI4JPXI4Pat6ue8I3dtf+FPDF9ZiVbO98PaLd2qzDEw' , String crlf,
'  trnTbaaASgAASiJ0EgAHz54HSuhr0aj5qk5fzTk/vk2eZFWjFdkl9yCv5j/+Dr79mzWfj3/wSr8R' , String crlf,
'  +M/DltBcap+zT8W/BXxl1WRgrXsPge4j1vwB4qmsyAzhdNk8Y6Vrt9kCKLTdGubq5aOC0kkX+nCv' , String crlf,
'  mX9pbwxofxN+D3xM+Eniiwi1Lwv8VfCviz4beJbOZDIk2h+MdIvvDt+I45CiLOlvqMkls+dy3qQX' , String crlf,
'  EB3xoRjVqKlSqVZJtU4Sk0t3ZNqK83ay6X3aRpTjzThFfamo3v8ADe75mkm5JW1S1P8AKV/Zl+Mn' , String crlf,
'  jXwT4e8F6fpPwd8Ia7ovhQ+Hr3UbrUtIv5NWl1zS7C41rQNWk167v4AkMEFiWS70m0m0yP7Ra6fc' , String crlf,
'  yL9riR/13+M37Vv7YWqaf4VHwt8E+F9Fu/EXgDT/AB/4gl1/wvB4juNGstZsZ9QXw/LHqekappcR' , String crlf,
'  v7qzsrS3RYIoop9Q0+G4vrS1ikurH418RfGDwH8F/BWtfDHTfAq+I/Hnw68UzeDNP07VJr62u9bb' , String crlf,
'  w1qU2nDw1oxghnubRLyTT4P9ImilQ2JkEjiPcw92uf25fit8Q9e8B+K/EPwI0j4GaB4W0nSbZdfu' , String crlf,
'  tVutWitrfw9pKxamk2iQolnrGk63O6Q3EkJeJEGy3CyRED+dak8TiswnmGH4fwFClSxWNnX9vjL1' , String crlf,
'  sVNzj7KrLDykqrmry5pqFmrQ5+WyP6fwEcNg8peXYjizG1Z4nB5esP8AVMBU5MFCMLzgswjRqKhG' , String crlf,
'  UUm/rE1GnbmTalY+Bf2jNY+M3xctfFOofEP4a6rYWP8Awi+rJdSR6Boul2elaqmn28tsthJpV9Jp' , String crlf,
'  WrWv9puZIxaPd3dqkYjmZpFYn47/AOCWX7KOuftZ/ttfsufCzVNCurbwR4n+N3gO7+IOqXytpelL' , String crlf,
'  4W03W01/W40vryPyJ9U1WHRdQ0/TNPt/tEs97dw2kEMcsixH9fv2ov2iF+K+h3mnaB4E0vSY9UtU' , String crlf,
'  e2v9AZTosbXKLDPc6bC2biBWuJQXE5YIV2N8ykD7W/4I0fC+z1v4w/BSytYdSez8FeMtT+IutXlo' , String crlf,
'  4nsLaXw9m8sEnEIR9Le7vbS1g3XMscd79phhtEeSKda+u4X4ixuEVWlDLMPQlmGYYOjChRk40Kbm' , String crlf,
'  uXFVuSTlZyUU21onZq3T43inhrLsfWlVq57iMXHLslx2MqY2pTUq1edOCrYbD86S9o3Ncqt8TahH' , String crlf,
'  4kf6HGibRoukBIxEn9l2GyIDAjX7JFtjAwMBBhQMDAHStOsnQHMmhaLISSX0nTXJOcktZwsSc5Oe' , String crlf,
'  e5J9a1q/YJNNtrZttddL9z8P/r+rBXz/APFO0uLrR9WRNzyQ3VxcRgHLIpd2/djYdqgpEzxiKUTH' , String crlf,
'  ducEkn6Ar4r/AGg/2hPgl+z/AKXrniv48fFr4ffCPwpFc6io1T4ieK9G8MQXYj852i0y21WeC91u' , String crlf,
'  4dR+5sdEtL+9lyqxRuxXOdRRlTqQlblnCUXd6Wdr9bv5XBSlGUHHdO9/Nar73ofws/8ABZL9k/wp' , String crlf,
'  8HP2v7Px3P8AC7w7L8FP2lLGG+0A2dnLpOmeG/itpVjDp3jPRvM077HBp11q0Yi8XrEY1t9Ujvb9' , String crlf,
'  RJO9nORzeoRtdfCeLSfGvhf4Tz+DbG1t2srPSvD+iabqGqWix20Al1Y2djDNqNrHDbORb3LQ2ztI' , String crlf,
'  JZJPOODqf8Fyv+CiXwS/bn8E+Cvgb+yN431vxd4W8F/Ee9+IvirxzZ+H9Z8N6BqPiCx0W50jwbbe' , String crlf,
'  GP8AhIbXTvEGpx6Yup67eajPNpVtbT/bbGK1ea18x4/5uBrvx78UeH/sWufFrXRYaTJ9ij0S+nml' , String crlf,
'  vYpg5tzaW8KOJZlBBk3sHURESklGBr8mx+VwqZhXWFzdYWnSnGjXwM6uKUYVq8aFRVqNOjGUacZq' , String crlf,
'  UozfKnzJK9z9zyCvmeDyLLMVXyOpmH9r0Kn1DF0KOHlUqxwVaphfYYqdWMnNwupQTduT3o3SZ9we' , String crlf,
'  NfjJ4b0eTxbY6R/Zlhp0ksWg+GoLNY4Us7SF5Zr06am4lYFuGWKOUjbIsOEJKmv6ev8Ag27+KHwL' , String crlf,
'  8Y/CLx98P/DV/YWPxwsPiJqvxD+J3h+8luI9e1nwlNB4e8N+A/FNo89rsPhu0FgPD09vbtcPpWtS' , String crlf,
'  Ne36W665ZeZ/G74S+Fy6Jpa654ruZtU1KWNfIW6Ms0cB3Z2QxgbWnBdVeQZUtzyCKwvgJ+1v8Zv2' , String crlf,
'  QP2nvDH7SHwA10aJ4v8AA2qS29vZXayXHhzxb4blUW+u+DPFunRSRjVPDXiO3jkt7uOMi4tW+z6l' , String crlf,
'  pt3Z6hb6fMnucM4DCRzGs8PUdf2K9rUxDi40rpxtThzJuTnLVuyk931vycfZLjso4bwmKzp0sLmO' , String crlf,
'  Y140cFlcJRlVo0oQlVrTxMuX2dlFQpunS5o03VotzvNKP+094dIbw/oTKMKdG0wqMFcA2UBA2lnK' , String crlf,
'  4HGCzEdNx6nYr51/ZA+L9z+0J+yX+y78fL3QbbwtefHD9nX4J/F+78MWd3NqFp4cufiX8NPDPjSf' , String crlf,
'  QbW/uI4p7220iXWn0+C7niimuYrdZpI0d2UfRVfoMt36v8z8WVrK21lb0Cv8b/8A4KseLPEGu/8A' , String crlf,
'  BS7/AIKB/wDCQ67rOtR6L+2t+1VpGlDWNVvdRTTNJ0X44+O9P0nSNPF3PI1jp2n2kENpYWFii21t' , String crlf,
'  bRRQRxCNAo/2QK/mV+Pv/Bqb/wAE8/2i/jl8Z/j/AONvjN+2fpXjH45/Fj4jfGLxbpfhX4ifA+x8' , String crlf,
'  Mad4n+J3jHWPG2v2Ph2y1f8AZ11zVbTQrTVdbu7fSLXU9a1fUINPjt4r3U9QuUku5cqkFPluk0n8' , String crlf,
'  9WloO7Wzsf51HhDxPrWj+CtOs/CCQHxL4lk1W6n1G6i+02+l2sV41g99JAuxpJ0ihtLKwAe3KMty' , String crlf,
'  8MeYiB+gnhj9mzwXZfs4eH/2n4bxdDXxP8YJ/hHceE/FPiW+1rV9Y8ZaV4Zsta1rXvCN5qeiafb3' , String crlf,
'  WnXEt2txPpNnqWq3OkRXdtb3V1KxSaX+z/wp/wAGmn/BOPwfZy2ml/F/9s6YzBFe5v8A4h/A6e52' , String crlf,
'  pcPchVaP9nSCJFaSRg4SEBlx/F8x9c8bf8Gzv7CHjj4cfDP4W3PxZ/a60Lwx8KrybVPD/wDwj/xE' , String crlf,
'  +E8F9faxca3deIrnV9ck1P4G6raXd/Pq1yk7PZ2WnwxRWdlaW8ENnE8En5vj8pxWKxWZYXD1qWHj' , String crlf,
'  Vrzr4qunN160PrHPTppqn7kaMfY0acIySUIzblzNNf0fl/FGFyXLeA8Zy47EYnARwdCngZOKymlh' , String crlf,
'  Z4Wnh8xdOi8Q1PF4+8q88TUoKqqtRQc5UaNKB/nZftBeNIdHtbnw5pUgh1OeK3ilaDEbaaLuIGG1' , String crlf,
'  UliqXsltJLfGUsRBbyWvmH54yfiRkRlD4JUAHZL/AAjZjnoQFPBJ59eRX+lbr3/Bor/wTh8SXP2z' , String crlf,
'  Vfjp+3LNcvLfXFxKvxK+Aam6u9RuPPvbq4Vv2Z3QyzBYbYrGscEdpbW9vFCiKwfBb/gzz/4JnsCD' , String crlf,
'  8c/26hnncPiZ8ANwPcgn9mM8k/McgjPbHFfYcPZXTyrLqdFNTrVHKeIqq756ibg+Vys1C8XaL2Vr' , String crlf,
'  u9z8v8T+LcRxhxPXxcoyo4PDwhRwGEcYxWHoTUKnvRhOVN1pudq1SCiqns6dlGnCnSpfuf8A8EuB' , String crlf,
'  j/gmX/wTpHAx+wn+yKMDoMfs/wDw+6e3pX3ZXk3wE+Dnhr9nb4F/Bf8AZ+8F6hr+reDvgX8Jvhz8' , String crlf,
'  HPCeq+K7rTr3xRqfhr4Y+D9G8FaFqHiS90fStC0m71+90vRLW51i60vRNH0641GW5lstK0+2eK0h' , String crlf,
'  9Zr3D8/WiS7JH//Z' , String crlf,
'item7.X-ABRELATEDNAMES;type=pref:Virginia Johns' , String crlf,
'item7.X-ABLabel:_$!<Assistant>!$_' , String crlf,
'item8.X-ABRELATEDNAMES:Norma Brown' , String crlf,
'item8.X-ABLabel:_$!<Spouse>!$_' , String crlf,
'END:VCARD' , String crlf
]

{ #category : #'testing-exporting' }
ICVCardTest >> testExportAvi [
	"This test may FAIL because of Dictionary ordering.
	The Dictionary parameter in:
		ICVCardGenerator>>email:parameters:
	means that parameters may appear in a different order then
	the expected result has used.
	"
	| cards exporter str |
	cards := ICCardHandParser parseVCardString: self aviCardString.
	cards anyOne photo: nil.
	
	exporter := ICVCardExporter cards: cards.
	exporter export.
	str := self aviCardStringExport.

	self assert: exporter dataStream contents equals: str.

	exporter dataStream contents 
		keysAndValuesDo: [:index :value |
			self assert: value equals: (str at: index) ].
	
]

{ #category : #'testing-exporting' }
ICVCardTest >> testExportGoofy [
	"This test may FAIL because of Dictionary ordering.
	The Dictionary parameter in:
		ICVCardGenerator>>email:parameters:
	means that parameters may appear in a different order then
	the expected result has used.
	"
	| cards exporter str |
	cards := ICCardHandParser parseVCardString: self goofyCardString.
	cards anyOne photo: nil.
	
	exporter := ICVCardExporter cards: cards.
	exporter export.
	str := self goofyCardStringExport.

	exporter dataStream contents 
		keysAndValuesDo: [:index :value |
			self assert: value equals: (str at: index) ].
	self assert: exporter dataStream contents equals: str.

]

{ #category : #'testing-exporting' }
ICVCardTest >> testIsOrganization [
	| card |
	card := ICVCard new
		fullname: 'Tantek «elik';
		yourself.
	self deny: card isOrganization.
	card organization: (ICOrganization new
		name: 'Technorati';
		yourself).
	self deny: card isOrganization.
	card fullname: 'Technorati'.
	self assert: card isOrganization
]

{ #category : #'testing-parsing' }
ICVCardTest >> testName [
	| name |
	name := ICName fromICalString: 'Public;John;Quinlan;Mr.;Esq' parameters: Dictionary new.
	self assert: name familyName = 	'Public'.
	self assert: name givenName = 	'John'.
	self assert: name additionalNames size = 1.
	self assert: name additionalNames first = 'Quinlan'.
	self assert: name honorificPrefixes size = 1.
	self assert: name honorificPrefixes first = 'Mr.'.
	self assert: name honorificSuffixes size = 1.
	self assert: name honorificSuffixes first = 'Esq'.

	name := ICName fromICalString: 'Stevenson;John;Philip,Paul;Dr.;Jr.,M.D.,A.C.P.' parameters: Dictionary new.
	self assert: name familyName = 	'Stevenson'.
	self assert: name givenName = 	'John'.
		
	self assert: name additionalNames size = 2.
	self assert: name additionalNames first = 'Philip'.
	self assert: name additionalNames second = 'Paul'.
	
	self assert: name honorificPrefixes size = 1.
	self assert: name honorificPrefixes first = 'Dr.'.
	
	self assert: name honorificSuffixes size = 3.
	self assert: name honorificSuffixes first = 'Jr.'.
	self assert: name honorificSuffixes second = 'M.D.'.
	self assert: name honorificSuffixes third = 'A.C.P.'.
]

{ #category : #'testing-parsing' }
ICVCardTest >> testParseAvi [
	| cards card address name phoneNumber emailAddress imid |
	cards := ICCardHandParser parseVCardString: self aviCardString.
	self assert: cards size = 1.
	card := cards anyOne.
	
	self assert: card fullname = 'Avi Bryant'.
	self assert: card version = 3.0.
	name := card name.
	self assert: name notNil.
	self assert: name familyName = 'Bryant'.
	self assert: name givenName = 'Avi'.
	self assert: name additionalNames isEmptyOrNil.
	self assert: name honorificPrefixes isEmptyOrNil.
	self assert: name honorificSuffixes isEmptyOrNil.
	
	self assert: card addresses size = 1.
	address := card addresses anyOne.
	
	self assert: address isHome.
	self deny: address isDomestic.
	self deny: address isInternational.
	self deny: address isParcel.
	self deny: address isPostal.
	self assert: address isPreferred.
	self deny: address isWork.
	
	self assert: address poBox isEmptyOrNil.
	self assert: address extended isEmptyOrNil.
	
	self assert: address street = 'xxx E. xx Ave'.
	self assert: address locality = 'Vancouver'.
	self assert: address region = 'BC'.
	self assert: address postalcode = 'V5V 1E3'.
	self assert: address country = 'Canada'.
	
	self assert: card phoneNumbers size = 1.
	phoneNumber := card phoneNumbers first.
	self assert: phoneNumber number = '(778) xxx-xxxx'.
	self assert: phoneNumber isHome.
	self assert: phoneNumber isPreferred.
	self deny: phoneNumber isWork.
	self deny: phoneNumber isBulletinBoard.
	self deny: phoneNumber isCar.
	self deny: phoneNumber isCellular.
	self deny: phoneNumber isFax.
	self deny: phoneNumber isISDN.
	self deny: phoneNumber isModem.
	self deny: phoneNumber isPager.
	self deny: phoneNumber isVoice.
	self deny: phoneNumber isVoiceMessage.
	
	self assert: card emailAddresses size = 2.
	emailAddress := card emailAddresses first.
	self assert: emailAddress address = 'avi@smallthought.com'.
	self assert: emailAddress isWork.
	self assert: emailAddress isPreferred.
	self deny: emailAddress isHome.
	self assert: emailAddress isInternet.
	self deny: emailAddress isX400.
	
	emailAddress := card emailAddresses second.
	self assert: emailAddress address = 'avi.bryant@gmail.com'.
	self deny: emailAddress isWork.
	self deny: emailAddress isPreferred.
	self assert: emailAddress isHome.
	self assert: emailAddress isInternet.
	self deny: emailAddress isX400.
	
	self assert: card photo iCalType = 'BINARY'.
	
	self assert: card aimids size = 1.
	imid := card aimids anyOne.
	self assert: (imid isKindOf: ICAIMId).
	self assert: imid isPreferred.
	self deny: imid isWork.
	self deny: imid isHome.
	self assert: imid id = 'avbry'.
	
	self assert: card icqids isEmpty.
	
	self assert: card msnids size = 1.
	imid := card msnids anyOne.
	self assert: (imid isKindOf: ICMSNId).
	self assert: imid isPreferred.
	self deny: imid isWork.
	self deny: imid isHome.
	self assert: imid id = 'avi666@hotmail.com'.
	
	self assert: card yahooids isEmpty.
	self assert: (card timeZone isKindOf: ICUtcOffset).
	self assert: (card timeZone totalSeconds = (5 * 60 * 60) negated)
	
]

{ #category : #'testing-parsing' }
ICVCardTest >> testParseEric [
	| cards card name imid |
	cards := ICCardHandParser parseVCardString: self ericCardString.
	self assert: cards size = 1.
	card := cards anyOne.
	
	self assert: card fullname = 'Eric Wahlforss'.
	self assert: card title = 'Entrepreneur / Musician'.
	self assert: card url asVCardString = 'http://eric.wahlforss.com/'.
	self assert: card version = 3.0.
	name := card name.
	self assert: name notNil.
	self assert: name familyName = 'Wahlforss'.
	self assert: name givenName = 'Eric'.
	self assert: name additionalNames isEmptyOrNil.
	self assert: name honorificPrefixes isEmptyOrNil.
	self assert: name honorificSuffixes isEmptyOrNil.
	
	self assert: card aimids size = 1.	
	imid := card aimids anyOne.
	self assert: (imid isKindOf: ICAIMId).
	self assert: imid isPreferred.
	self deny: imid isWork.
	self assert: imid isHome.
	self assert: imid id = 'ericwahlforss'.
	
	self assert: card icqids size = 1.	
	imid := card icqids anyOne.
	self assert: (imid isKindOf: ICICQId).
	self assert: imid isPreferred.
	self assert: imid isWork.
	self deny: imid isHome.
	self assert: imid id = '5399905'.
	
	self assert: card msnids size = 1.
	imid := card msnids anyOne.
	self assert: (imid isKindOf: ICMSNId).
	self deny: imid isPreferred.
	self deny: imid isWork.
	self assert: imid isHome.
	self assert: imid id = 'ericwahlforss@hotmail.com'.
	
	self assert: card yahooids isEmpty.
	
	self assert: card categories size = 1.
	self assert: card categories anyOne summary = '24HDC'
	
]

{ #category : #'testing-parsing' }
ICVCardTest >> testParseGoofy [
	| cards card address name phoneNumber |
	cards := ICCardHandParser parseVCardString: self goofyCardString.
	self assert: cards size = 1.
	card := cards anyOne.
	
	self assert: card fullname = 'Markus Tschannen'.
	self assert: card version = 2.1.
	self assert: card birthday = (self dateClass year: 1980 month: 10 day: 30).
	name := card name.
	self assert: name notNil.
	self assert: name familyName = 'Tschannen'.
	self assert: name givenName = 'Markus'.
	self assert: name additionalNames isEmptyOrNil.
	self assert: name honorificPrefixes isEmptyOrNil.
	self assert: name honorificSuffixes isEmptyOrNil.
	
	self assert: card addresses size = 1.
	address := card addresses anyOne.
	
	self assert: address isHome.
	self deny: address isDomestic.
	self deny: address isInternational.
	self deny: address isParcel.
	self deny: address isPostal.
	self deny: address isPreferred.
	self deny: address isWork.
	
	self assert: address poBox isEmptyOrNil.
	self assert: address extended isEmptyOrNil.
	
	self assert: address street = 'Neufeldstrasse 11'.
	self assert: address locality = 'Bern'.
	self assert: address region isEmptyOrNil.
	self assert: address postalcode = '3012'.
	self assert: address country = 'Schweiz'.
	
	self assert: card phoneNumbers size = 2.
	phoneNumber := card phoneNumbers first.
	self assert: phoneNumber number = '+41 31 302 08 56'.
	self assert: phoneNumber isHome.
	self deny: phoneNumber isPreferred.
	self deny: phoneNumber isWork.
	self deny: phoneNumber isBulletinBoard.
	self deny: phoneNumber isCar.
	self deny: phoneNumber isCellular.
	self deny: phoneNumber isFax.
	self deny: phoneNumber isISDN.
	self deny: phoneNumber isModem.
	self deny: phoneNumber isPager.
	self assert: phoneNumber isVoice.
	self deny: phoneNumber isVoiceMessage.
	
	phoneNumber := card phoneNumbers second.
	self assert: phoneNumber number = '+41 78 845 24 12'.
	self assert: phoneNumber isHome.
	self deny: phoneNumber isPreferred.
	self deny: phoneNumber isWork.
	self deny: phoneNumber isBulletinBoard.
	self deny: phoneNumber isCar.
	self assert: phoneNumber isCellular.
	self deny: phoneNumber isFax.
	self deny: phoneNumber isISDN.
	self deny: phoneNumber isModem.
	self deny: phoneNumber isPager.
	self deny: phoneNumber isVoice.
	self deny: phoneNumber isVoiceMessage.
	
	self assert: card emailAddresses isEmpty.
	self assert: (card timeZone isKindOf: String).
	self assert: (card timeZone = '-05:00; EST; Raleigh/North America').
	self assert: card geo = (37.386013 @ -122.082932)
]

{ #category : #'testing-parsing' }
ICVCardTest >> testParseMaeve [
	| cards card name imid |
	cards := ICCardHandParser parseVCardString: self maeveCardString.
	self assert: cards size = 1.
	card := cards anyOne.
	
	self assert: card fullname = 'Maeve Price'.
	self assert: card title = 'Digital Editor'.
	self assert: card version = 3.0.
	name := card name.
	self assert: name notNil.
	self assert: name familyName = 'Price'.
	self assert: name givenName = 'Maeve'.
	self assert: name additionalNames isEmptyOrNil.
	self assert: name honorificPrefixes isEmptyOrNil.
	self assert: name honorificSuffixes isEmptyOrNil.
	
	self assert: card aimids size = 1.
	imid := card aimids anyOne.
	self assert: imid isPreferred.
	self deny: imid isWork.
	self assert: imid isHome.
	self assert: imid id = 'Mahaevey'.
	
	self assert: card icqids isEmpty.
	
	self assert: card msnids size = 1.
	imid := card msnids anyOne.
	self assert: (imid isKindOf: ICMSNId).
	self assert: imid isPreferred.
	self deny: imid isWork.
	self assert: imid isHome.
	self assert: imid id = 'dgu186@hotmail.com'.
	
	self assert: card yahooids isEmpty.
	
	self assert: card categories size = 3.
	#('Friends' 'Columbia College Chicago' 'Family') do: [ :each |
		self assert: (card categories anySatisfy: [ :cat | cat summary = each  ]) ].
	
	self assert: card notes isEmpty	
]

{ #category : #'testing-parsing' }
ICVCardTest >> testParseMaeveUrl [
	| cards card |
	cards := ICCardHandParser parseVCardString: self maeveCardString.
	self assert: cards size = 1.
	card := cards anyOne.
	
	self assert: card url asVCardString equals: 'http\://www.myspace.com/maeveprice'.	
]

{ #category : #'testing-parsing' }
ICVCardTest >> testParseOscar [
	| cards card address name phoneNumber emailAddress organization |
	cards := ICCardHandParser parseVCardString: self oscarCardString.
	self assert: cards size = 1.
	card := cards anyOne.
	
	self assert: card fullname = 'Oscar2 Nierstrasz'.
	self assert: card version = 3.0.
	self assert: card title = 'Professor'.
	
	name := card name.
	self assert: name notNil.
	self assert: name familyName = 'Nierstrasz'.
	self assert: name givenName = 'Oscar'.
	self assert: name additionalNames isEmptyOrNil.
	self assert: name honorificPrefixes isEmptyOrNil.
	self assert: name honorificSuffixes isEmptyOrNil.
	
	self assert: card addresses size = 3.
	address := card addresses first.
	
	self deny: address isHome.
	self deny: address isDomestic.
	self deny: address isInternational.
	self deny: address isParcel.
	self deny: address isPostal.
	self assert: address isPreferred.
	self assert: address isWork.
	
	self assert: address poBox isEmptyOrNil.
	self assert: address extended isEmptyOrNil.
	
	self assert: address street = 'Software Composition Group
IAM, University of Bern
Neubrueckstrasse 10'.
	self assert: address locality = 'Bern'.
	self assert: address region isEmptyOrNil.
	self assert: address postalcode = 'CH-3012'.
	self assert: address country = 'SWITZERLAND'.
	
	address := card addresses second.
	
	self assert: address isHome.
	self deny: address isDomestic.
	self deny: address isInternational.
	self deny: address isParcel.
	self deny: address isPostal.
	self deny: address isPreferred.
	self deny: address isWork.
	
	self assert: address poBox isEmptyOrNil.
	self assert: address extended isEmptyOrNil.
	
	self assert: address street = 'Fluhmattweg 41'.
	self assert: address locality = 'Kehrsatz'.
	self assert: address region isEmptyOrNil.
	self assert: address postalcode = '3122'.
	self assert: address country = 'SWITZERLAND'.
	
	address := card addresses third.
	
	self assert: address isHome.
	self deny: address isDomestic.
	self deny: address isInternational.
	self deny: address isParcel.
	self deny: address isPostal.
	self deny: address isPreferred.
	self deny: address isWork.
	
	self assert: address poBox isEmptyOrNil.
	self assert: address extended isEmptyOrNil.
	
	self assert: address street = 'Schuetzenmattstrasse 14, room 103'.
	self assert: address locality isEmptyOrNil.
	self assert: address region isEmptyOrNil.
	self assert: address postalcode isEmptyOrNil.
	self assert: address country isEmptyOrNil.
	
	self assert: card phoneNumbers size = 3.
	phoneNumber := card phoneNumbers first.
	self assert: phoneNumber number = '+41 31 631.4618'.
	self deny: phoneNumber isHome.
	self assert: phoneNumber isPreferred.
	self assert: phoneNumber isWork.
	self deny: phoneNumber isBulletinBoard.
	self deny: phoneNumber isCar.
	self deny: phoneNumber isCellular.
	self deny: phoneNumber isFax.
	self deny: phoneNumber isISDN.
	self deny: phoneNumber isModem.
	self deny: phoneNumber isPager.
	self deny: phoneNumber isVoice.
	self deny: phoneNumber isVoiceMessage.
	
	phoneNumber := card phoneNumbers second.
	self assert: phoneNumber number = '+41 31 961.7065'.
	self assert: phoneNumber isHome.
	self deny: phoneNumber isPreferred.
	self deny: phoneNumber isWork.
	self deny: phoneNumber isBulletinBoard.
	self deny: phoneNumber isCar.
	self deny: phoneNumber isCellular.
	self deny: phoneNumber isFax.
	self deny: phoneNumber isISDN.
	self deny: phoneNumber isModem.
	self deny: phoneNumber isPager.
	self deny: phoneNumber isVoice.
	self deny: phoneNumber isVoiceMessage.
	
	phoneNumber := card phoneNumbers third.
	self assert: phoneNumber number = '+41 31 631.3355'.
	self deny: phoneNumber isHome.
	self deny: phoneNumber isPreferred.
	self assert: phoneNumber isWork.
	self deny: phoneNumber isBulletinBoard.
	self deny: phoneNumber isCar.
	self deny: phoneNumber isCellular.
	self assert: phoneNumber isFax.
	self deny: phoneNumber isISDN.
	self deny: phoneNumber isModem.
	self deny: phoneNumber isPager.
	self deny: phoneNumber isVoice.
	self deny: phoneNumber isVoiceMessage.
	
	self assert: card emailAddresses size = 1.
	emailAddress := card emailAddresses first.
	self assert: emailAddress address = 'oscar.nierstrasz@acm.org'.
	self assert: emailAddress isWork.
	self assert: emailAddress isPreferred.
	self deny: emailAddress isHome.
	self assert: emailAddress isInternet.
	self deny: emailAddress isX400.
	
	organization := card organization.
	self assert: organization name = 'University of Bern'.
	self assert: organization unitNames isEmpty.
]

{ #category : #'testing-parsing' }
ICVCardTest >> testParseOscarUrl [
	| cards card |
	cards := ICCardHandParser parseVCardString: self oscarCardString.
	self assert: cards size = 1.
	card := cards anyOne.

	self assert: card url asVCardString = 'http://www.iam.unibe.ch/~oscar/'.
	
]

{ #category : #'testing-parsing' }
ICVCardTest >> testParsePhilippe [
	| cards card address name emailAddress |
	cards := ICCardHandParser parseVCardString: self philippeCardString.
	self assert: cards size = 1.
	card := cards anyOne.
	
	self assert: card fullname = 'Philippe Marschall'.
	self assert: card version = 2.1.
	name := card name.
	self assert: name notNil.
	self assert: name familyName = 'Marschall'.
	self assert: name givenName = 'Philippe'.
	self assert: card nickname = 'pmm'.
	self assert: name additionalNames isEmptyOrNil.
	self assert: name honorificPrefixes isEmptyOrNil.
	self assert: name honorificSuffixes isEmptyOrNil.
	
	self assert: card addresses size = 1.
	address := card addresses anyOne.
	
	self assert: address isHome.
	self deny: address isDomestic.
	self deny: address isInternational.
	self deny: address isParcel.
	self deny: address isPostal.
	self deny: address isPreferred.
	self deny: address isWork.
	
	self assert: address poBox isEmptyOrNil.
	self assert: address extended isEmptyOrNil.
	
	self assert: address street = 'Poststrasse 1'.
	self assert: address locality = 'Zürich'.
	self assert: address region isEmptyOrNil.
	self assert: address postalcode = '8001'.
	self assert: address country isEmptyOrNil.
	
	self assert: card phoneNumbers isEmpty.
	
	self assert: card emailAddresses size = 1.
	emailAddress := card emailAddresses anyOne.
	self assert: emailAddress address = 'philippe.marschall@gmail.com'.
	self deny: emailAddress isWork.
	self deny: emailAddress isPreferred.
	self deny: emailAddress isHome.
	self assert: emailAddress isInternet.
	self deny: emailAddress isX400.
	
	self assert: card photo isNil.
	
	self assert: card aimids isEmpty.
	
	self assert: card icqids isEmpty.
	
	self assert: card msnids isEmpty.
	
	self assert: card yahooids isEmpty.
	
]

{ #category : #'testing-parsing' }
ICVCardTest >> testParseSean [
	| cards card address name phoneNumber emailAddress organization |
	cards := ICCardHandParser parseVCardString: self seanCardString.
	self assert: cards size = 1.
	card := cards anyOne.
	
	self assert: card fullname = 'Sean Glazier'.
	self assert: card version = 2.1.
	self assert: card title = 'Lead Software Engineer'.
	self assert: card birthday = (self dateClass year: 2005 month: 10 day: 01).
	name := card name.
	self assert: name notNil.
	self assert: name familyName = 'Glazier'.
	self assert: name givenName = 'Sean'.
	self assert: name additionalNames isEmptyOrNil.
	self assert: name honorificPrefixes isEmptyOrNil.
	self assert: name honorificSuffixes isEmptyOrNil.
	
	self assert: card addresses size = 2.
	address := card addresses first.
	
	self deny: address isHome.
	self deny: address isDomestic.
	self deny: address isInternational.
	self deny: address isParcel.
	self deny: address isPostal.
	self deny: address isPreferred.
	self assert: address isWork.
	
	self assert: address poBox isEmptyOrNil.
	self assert: address extended isEmptyOrNil.
	
	self assert: address street = '6 Christie Lane'.
	self assert: address locality = 'Stratham'.
	self assert: address region = 'NH'.
	self assert: address postalcode = '03885'.
	self assert: address country = 'USA'.
	
	address := card addresses second.
	
	self assert: address isHome.
	self deny: address isDomestic.
	self deny: address isInternational.
	self deny: address isParcel.
	self deny: address isPostal.
	self deny: address isPreferred.
	self deny: address isWork.
	
	self assert: address poBox isEmptyOrNil.
	self assert: address extended isEmptyOrNil.
	
	self assert: address street = '6 Christie Lane'.
	self assert: address locality = 'Stratham'.
	self assert: address region = 'NH'.
	self assert: address postalcode = '03885'.
	self assert: address country = 'USA'.
	
	self assert: card phoneNumbers size = 4.
	phoneNumber := card phoneNumbers first.
	self assert: phoneNumber number = '603 772 4480'.
	self deny: phoneNumber isHome.
	self deny: phoneNumber isPreferred.
	self assert: phoneNumber isWork.
	self deny: phoneNumber isBulletinBoard.
	self deny: phoneNumber isCar.
	self deny: phoneNumber isCellular.
	self deny: phoneNumber isFax.
	self deny: phoneNumber isISDN.
	self deny: phoneNumber isModem.
	self deny: phoneNumber isPager.
	self assert: phoneNumber isVoice.
	self deny: phoneNumber isVoiceMessage.
	
	phoneNumber := card phoneNumbers second.
	self assert: phoneNumber number = '603 770 8260'.
	self deny: phoneNumber isHome.
	self deny: phoneNumber isPreferred.
	self deny: phoneNumber isWork.
	self deny: phoneNumber isBulletinBoard.
	self deny: phoneNumber isCar.
	self assert: phoneNumber isCellular.
	self deny: phoneNumber isFax.
	self deny: phoneNumber isISDN.
	self deny: phoneNumber isModem.
	self deny: phoneNumber isPager.
	self assert: phoneNumber isVoice.
	self deny: phoneNumber isVoiceMessage.
	
	phoneNumber := card phoneNumbers third.
	self assert: phoneNumber number = '603 772 2852'.
	self assert: phoneNumber isHome.
	self deny: phoneNumber isPreferred.
	self deny: phoneNumber isWork.
	self deny: phoneNumber isBulletinBoard.
	self deny: phoneNumber isCar.
	self deny: phoneNumber isCellular.
	self deny: phoneNumber isFax.
	self deny: phoneNumber isISDN.
	self deny: phoneNumber isModem.
	self deny: phoneNumber isPager.
	self assert: phoneNumber isVoice.
	self deny: phoneNumber isVoiceMessage.
	
	phoneNumber := card phoneNumbers fourth.
	self assert: phoneNumber number = '603 770 8260'.
	self deny: phoneNumber isHome.
	self deny: phoneNumber isPreferred.
	self deny: phoneNumber isWork.
	self deny: phoneNumber isBulletinBoard.
	self deny: phoneNumber isCar.
	self assert: phoneNumber isCellular.
	self deny: phoneNumber isFax.
	self deny: phoneNumber isISDN.
	self deny: phoneNumber isModem.
	self deny: phoneNumber isPager.
	self assert: phoneNumber isVoice.
	self deny: phoneNumber isVoiceMessage.
	
	self assert: card emailAddresses size = 2.
	emailAddress := card emailAddresses first.
	self assert: emailAddress address = 'sglazier@comcast.net'.
	self assert: emailAddress isWork.
	self assert: emailAddress isPreferred.
	self deny: emailAddress isHome.
	self assert: emailAddress isInternet.
	self deny: emailAddress isX400.
	
	emailAddress := card emailAddresses second.
	self assert: emailAddress address = 'sglazier@comcast.net'.
	self deny: emailAddress isWork.
	self deny: emailAddress isPreferred.
	self assert: emailAddress isHome.
	self assert: emailAddress isInternet.
	self deny: emailAddress isX400.
	
	organization := card organization.
	self assert: organization name = 'Cincom Systems'.
	self assert: organization unitNames isEmpty.
	
]

{ #category : #'testing-parsing' }
ICVCardTest >> testParseSurendar [
	| cards card name imid organization |
	cards := ICCardHandParser parseVCardString: self surendarCardString.
	self assert: cards size = 1.
	card := cards anyOne.
	
	self assert: card fullname = 'Surendar Chandra'.
	self assert: card title = 'Asst. Professor'.
	self assert: card version = 3.0.
	name := card name.
	self assert: name notNil.
	self assert: name familyName = 'Chandra'.
	self assert: name givenName = 'Surendar'.
	self assert: name additionalNames isEmptyOrNil.
	self assert: name honorificPrefixes isEmptyOrNil.
	self assert: name honorificSuffixes isEmptyOrNil.
	
	self assert: card aimids size = 1.
	imid := card aimids anyOne.
	self assert: (imid isKindOf: ICAIMId).
	self assert: imid isPreferred.
	self deny: imid isWork.
	self assert: imid isHome.
	self assert: imid id = 'surendar'.
	
	self assert: card icqids isEmpty.
	
	self assert: card msnids size = 1.
	imid := card msnids anyOne.
	self assert: (imid isKindOf: ICMSNId).
	self assert: imid isPreferred.
	self deny: imid isWork.
	self assert: imid isHome.
	self assert: imid id = 'surendar'.
	
	self assert: card yahooids size = 1.
	imid := card yahooids anyOne.
	self assert: (imid isKindOf: ICYahooId).
	self assert: imid isPreferred.
	self assert: imid isWork.
	self deny: imid isHome.
	self assert: imid id = 'surendarcsdukeedu'.
	
	organization := card organization.
	self assert: organization name = 'Univ. of Notre Dame'.
	self assert: organization unitNames size = 1.
	self assert: organization unitNames anyOne = 'Computer Science and Engg'.
	
	self shouldnt: [ self assert: card notes size = 1 ] raise: Error.
	self assert: card notes anyOne equals:
'SMS message
12/22/2003 18:12
wassup

SMS message
12/23/2003 13:12
Hello'
	
]

{ #category : #'testing-parsing' }
ICVCardTest >> testParseSurendarUrl [
	| cards card |
	cards := ICCardHandParser parseVCardString: self surendarCardString.
	self assert: cards size = 1.
	card := cards anyOne.

	self assert: card url asVCardString = 'http://www.cse.nd.edu/~surendar/'.
]

{ #category : #'testing-parsing' }
ICVCardTest >> testParseWikipedia [
	| cards card address name phoneNumber emailAddress |
	cards := ICCardHandParser parseVCardString: self wikipediaCardString.
	self assert: cards size = 1.
	card := cards anyOne.
	
	self assert: card fullname = 'Firstname Lastname'.
	self assert: card version = 2.1.
	name := card name.
	self assert: name notNil.
	self assert: name familyName = 'Lastname'.
	self assert: name givenName = 'Firstname'.
	self assert: name additionalNames isEmptyOrNil.
	self assert: name honorificPrefixes isEmptyOrNil.
	self assert: name honorificSuffixes isEmptyOrNil.
	
	self assert: card addresses size = 1.
	address := card addresses anyOne.
	
	self deny: address isHome.
	self deny: address isDomestic.
	self deny: address isInternational.
	self deny: address isParcel.
	self deny: address isPostal.
	self assert: address isPreferred.
	self assert: address isWork.
	
	self assert: address poBox isEmptyOrNil.
	self assert: address locality isEmptyOrNil.
	
	self assert: address street = 'Bar Street 99'.
	self assert: address extended = ('Footown 12345', String lf, 'Fooland').
	self assert: address region isEmptyOrNil.
	self assert: address postalcode isEmptyOrNil.
	self assert: address country isEmptyOrNil.
	
	self assert: card phoneNumbers size = 1.
	phoneNumber := card phoneNumbers first.
	self assert: phoneNumber number = '+358-40-123456'.
	self deny: phoneNumber isHome.
	self deny: phoneNumber isPreferred.
	self deny: phoneNumber isWork.
	self deny: phoneNumber isBulletinBoard.
	self deny: phoneNumber isCar.
	self assert: phoneNumber isCellular.
	self deny: phoneNumber isFax.
	self deny: phoneNumber isISDN.
	self deny: phoneNumber isModem.
	self deny: phoneNumber isPager.
	self deny: phoneNumber isVoice.
	self deny: phoneNumber isVoiceMessage.

	
	self assert: card emailAddresses size = 1.
	emailAddress := card emailAddresses first.
	self assert: emailAddress address = 'nobody@example.invalid'.
	self deny: emailAddress isWork.
	self deny: emailAddress isPreferred.
	self deny: emailAddress isHome.
	self assert: emailAddress isInternet.
	self deny: emailAddress isX400.
]

{ #category : #'testing-parsing' }
ICVCardTest >> testUtcOffset [
	| offset |
	offset := ICUtcOffset fromVCardString: '-05:00'.
	self deny: offset positive.
	self assert: offset hours = 5.
	self assert: offset minutes = 0.
	self assert: offset seconds = 0.
	self assert: '-05:00'  = offset asVCardString.

	offset := ICUtcOffset fromVCardString: '+01:00'.
	self assert: offset positive.
	self assert: offset hours = 1.
	self assert: offset minutes = 0.
	self assert: offset seconds = 0.
	self assert: '+01:00'  = offset asVCardString.
	
	offset := ICUtcOffset fromVCardString: '+01:05'.
	self assert: offset positive.
	self assert: offset hours = 1.
	self assert: offset minutes = 5.
	self assert: offset seconds = 0.
	self assert: '+01:05'  = offset asVCardString.
	
	offset := ICUtcOffset fromVCardString: '-01:05'.
	self deny: offset positive.
	self assert: offset hours = 1.
	self assert: offset minutes = 5.
	self assert: offset seconds = 0.
	self assert: '-01:05'  = offset asVCardString.
]

{ #category : #'fixtures-parsing' }
ICVCardTest >> wikipediaCardString [
^
'BEGIN:VCARD' , String crlf ,
'VERSION:2.1' , String crlf ,
'FN:Firstname Lastname' , String crlf ,
'N:Lastname;Firstname' , String crlf ,
'ADR;WORK;PREF;ENCODING=QUOTED-PRINTABLE:;Footown 12345=0AFooland;Bar Street 99' , String crlf ,
'LABEL;ENCODING=QUOTED-PRINTABLE;WORK;PREF:Bar Street 99=0AFootown 12345=0AFooland' , String crlf ,
'TEL;CELL:+358-40-123456' , String crlf ,
'EMAIL;INTERNET:nobody@example.invalid' , String crlf ,
'UID:' , String crlf ,
'END:VCARD' , String crlf
]
