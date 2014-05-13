program filtraoli
!! Escribe solo los datos que en la primera columna tengan
!! los valores especificados

implicit none

real*8  ::ina,inb, inc, ind
real*8 ::liminf, limsup


open(unit=10,file='echala.in',status='old')
open(unit=12,file='echala.out',status='new')

liminf=0.d0
limsup=0.005d0

1 continue

read(10,*,end=2)ina,inb,inc, ind

 if((inb.ge.liminf).and.(inb.le.limsup))then
      write(12,*) ina  ,inb,inc, ind
  endif


goto 1

2 continue
 print*, "Ya'stas, Barrabas."

end program filtraoli
