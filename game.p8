pico-8 cartridge // http://www.pico-8.com
version 36
__lua__
function scene0()
 scene=scn_title
 scene.i()
end
function scene1()
 scene=scn_start
 scene.i()
end
function scene2()
 scene=scn_garage
 scene.i()
end
function scene3()
	scene=scn_office
 scene.i()
end
function scene4()
	scene=scn_city
 scene.i()
end
function scene5()
	scene=scn_storage
 scene.i()
end
function scene6()
	scene=scn_dashboard
 scene.i()
end
function scene7()
	scene=scn_analysis
	scene.i()
end
function scene8()
	scene=scn_nightly
	scene.i()
end

function _init()
 init_main_menu()
	data.init()
 mouse.init()
 scene0()
end

function _draw() 
	scene.d() 
end

function _update() 
	data.update()
	scene.u() 
end


-->8
fw=4 --font-width
fh=6 --font-height
function draw_main_frame() 
	rect(1,1,126,126,9)
	line(1,15,126,15,9)
	spr(1,-1,-1)
	spr(1,120,-1,1,1,true)
end

function hc(s)
  -- screen center minus the
  -- string length times the 
  -- pixels in a char's width,
  -- cut in half
  return 64-#s*fw/2
end

function vc(s)
  -- screen center minus the
  -- string height in pixels,
  -- cut in half
  return 61
end

function draw_top_bar()
local x,y,h,m,mw,mc
x=6 y=7
h=tostr(data.hour)
m=tostr(flr(data.minute))
if data.hour < 10 then h="0"..h end
if data.minute < 10 then m="0"..m end
color(9)
print("day "..data.day.." "..h..":"..m,x,y)

m=tostr(flr(data.money)).."$"
mw=#m*fw
mc=11
if data.money<=0 then	mc=8 end
print(m,120-mw,y,mc)

spr(data.weather_sprite(),70,0,2,2)

end

function draw_logo()
spr(2,50,26,4,2)
spr(6,46,46,5,2)

t=time()
if pt==nil or t-pt>0.01 then
if off==nil then off=0 end
off+=1
pt=t
end
if off==16 then off=0 end
for i=0, 8 do
	spr(16,i*16-off,119)
end
end

function pl(p1,p2)
line(p1.x, p1.y, p2.x,p2.y) 
end

function draw_garage_karren(idx)
local k,x,y,p1,p2,p3,p4,p5,wr
k=data.karren[idx]
color(8)
-- offset
x=48
y=70
-- body
p1={x=x,y=y}
p2={x=x+30,y=y}
p3={x=x+10,y=y+10}
p4={x=x+20,y=y+10}
-- holder
p5={x=p2.x+10,y=p2.y-8}
-- wheels
wr=2

-- mods
if k.u.s>1 then
	p1.x-=10	p2.x+=10
	p3.x-=10	p4.x+=10
end
if k.u.s>2 then
	p1.y-=10 p2.y-=10
	p5.x+=20 p5.y+=10
	wr=3
end
if k.u.s>3 then
	p1.x-=10	p2.x+=10
	p3.x-=10	p4.x+=10
	wr=4
end

-- body
pl(p1,p2) pl(p2,p4) 
pl(p1,p3) pl(p3,p4)
-- holder
pl(p2,p5)
-- wheels
circfill(p3.x,p3.y,wr)
circfill(p4.x,p4.y,wr)
color(0)
circ(p3.x,p3.y,wr+1)
circ(p4.x,p4.y,wr+1)
end

function draw_office()
local x,y,p1,p2,p3,p4,p5,p6,
						d1,d2,d3,d4,d5
color(4)
-- offset
x=33
y=70
-- window
rect(10,20,116,60)
draw_daytime_rect(11,21,115,59)
-- dom
d1={x=20,y=59}
d2={x=25,y=30}
d3={x=d1.x+10,y=d1.y}
d4={x=d2.x+10,y=d2.y}
d5={x=d1.x+20,y=d1.y}
color(0)
pl(d1,d2) pl(d2,d3)
pl(d3,d4) pl(d4,d5)
print("◆",d2.x-3,d2.y-2)
print("◆",d4.x-3,d4.y-2)
-- flipboard
rect(64,23,110,63,5)
rectfill(65,24,109,62,6)
line(67+19,62,67,80,6)
line(67+19,62,100,80,6)
-- plate
p1={x=x+10,y=y}
p2={x=x+50,y=y}
p3={x=x,y=y+12}
p4={x=x+60,y=y+12}
spr(12,x,70,2,2)
spr(12,78,70,2,2,true)
rectfill(x+11,y,x+49,p2.y+12,4) 
rectfill(x,y+12,x+60,y+24) 
line(x+11,y-1,x+49,y-1,5)
line(x,y+11,x+60,y+11,5)
line(x,y+11,x,y+24,5)
line(x+60,y+11,x+60,y+24,5)
-- drawers
spr(44,36,80,2,2)
spr(44,75,80,2,2)
-- chair
spr(14,56,74,2,3)
-- on table
spr(16,43,70)
spr(16,40,72)
end

function draw_city()
local p1,p2,p3,p4,p5,p6,p7,p8,
					 p9,p10,p11,p12

p1={x=50,y=30}
p2={x=p1.x-15,y=p1.y}
p3={x=p2.x-20,y=p2.y+15}
p4={x=p3.x-5,y=p3.y+10}
p5={x=p4.x+2,y=p4.y+20}
p6={x=p5.x+15,y=p5.y+15}
p7={x=p6.x+20,y=p6.y+5}
p8={x=p7.x+10,y=p7.y-5}
p9={x=p8.x-5,y=p8.y-16}
p10={x=p9.x+2,y=p9.y-16}
p11={x=p10.x-2,y=p10.y-10}
p12={x=p11.x+6,y=p11.y-16}

color(10)
pl(p1,p2) pl(p2,p3) pl(p3,p4)
pl(p4,p5) pl(p5,p6) pl(p6,p7)
pl(p7,p8) pl(p8,p9) pl(p9,p10)
pl(p10,p11) pl(p11,p12) 
pl(p12,p1)
color(12)
local r10,r12,r12,r13,r14,r15,r16,
						r20,r22,r22,r23,r24,r25,r26

r10={x=p12.x+1,y=p12.y-5}
r11={x=p12.x+1,y=p12.y}
r12={x=p11.x+1,y=p11.y}
r13={x=p10.x+1,y=p10.y}
r14={x=p9.x+1,y=p9.y}
r15={x=p8.x+1,y=p8.y}
r16={x=r15.x,y=r15.y+5}

pl(r10,r11)
pl(r11,r12) pl(r12,r13)
pl(r13,r14) pl(r14,r15) 
pl(r15,r16)

r20={x=r10.x+10,y=r10.y}
r21={x=r11.x+10,y=r11.y}
r22={x=r12.x+10,y=r12.y}
r23={x=r13.x+10,y=r13.y}
r24={x=r14.x+10,y=r14.y}
r25={x=r15.x+10,y=r15.y}
r26={x=r25.x,y=r25.y+5}

pl(r20,r21)
pl(r21,r22) pl(r22,r23)
pl(r23,r24) pl(r24,r25) 
pl(r25,r26)
end

function draw_storage()
local yoff,gooff,i,x,b
	color(5)
	yoff=74
	goff=3 -- general offset
	for i=1,data.storage.num do
		x=i*15+goff
		rect(x,yoff-50,x+11,	yoff)
	 for b=1,4 do
	 	line(x,yoff-b*10,x+11,	yoff-b*10)
	 end
	end
	
	num=data.storage.beer
	if num>90 then num=90 end
	xoff=14+goff
	x=0
	y=0
	for i=1,num do
		spr(16,x+xoff,yoff-7-y*10)
		if i%3==0 then 
			x=0
			y+=1
		else
			x+=3
		end
		
		if y > 4 then
			y=0
			xoff+=15
		end	
	end
end

function draw_dashboard()
	local k,v,y,poi_c,beer_c,c,cap
	print("PLATZ NAME    BEER   PRICE",7,20)
	for k,v in pairs(data.karren) do
		y=k*8+24
		poi_c=8
		beer_c=8
		c=6
		cap=data.karren_cap(v)
		if v.poi!=nil then poi_c=11 end
		if v.b>0 then beer_c=11 end		
		print("◆",12,y,poi_c)
		print(v.name,26,y,c)
		print(flr(v.b).."/"..cap,64,y,beer_c)
		print(v.p.."$",94,y,c)
		color(6)		
	end
	line(40,78,80,78,15)
	print("popularity: "..data.popularity,12,85)
end

function draw_price_control(idx,sel)
local i,x,y,c,cc,w
i=menu.i[idx]
y=28+4*(idx-1)
x=106
c=1
cc=1
if i.t=="-" then 
	x=114 
	y=28+4*(idx-2)
end
if sel then c=7 cc=13 end
w=print(i.t,x,y,c)
circ(x+1,y+2,3,cc)

return {
x1=x,  y1=y,
x2=x+fw,y2=y+fh
}
end

function draw_location()
	local x,y
	if scene.name=="" then return end
	y=118
	x=print(scene.name,6,y,1)
	print("▤",x,y,2)
end

function draw_base()
	cls()
	draw_daytime_top()
	draw_main_frame()
	draw_menu(menu)
	draw_menu(gmenu)
	draw_location()
end

function	draw_daytime_top()
	draw_daytime_rect(2,2,125,15)
end

function draw_daytime_rect(x1,y1,x2,y2)
local c,h
c=0
h=data.hour
if h>6 then c=1 end
if h>11 then c=12 end
if h>20 then c=1 end
if h>22 then c=0 end
rectfill(x1,y1,x2,y2,c)
end

function draw_city_poi(idx,sel)
	local mi,poi,r,c,pn
	mi=scene.menu_city.i[idx]
	poi=scene.pois[mi.fidx]
	pn=data.pois[mi.fidx].name
	rectfill(9,poi.y+5,9+#pn*fw*1+1,poi.y+5+fh,8)
	print(pn,10,poi.y+6,7)
	r=2	
	c=8
	if sel then c=9 end
	circfill(poi.x,poi.y,r,c)
	return {
		x1=poi.x-r,	
		y1=poi.y-r,
		x2=poi.x+2,
		y2=poi.y+2
	}	
end

function draw_city_karren(idx,sel)
local tc,x,m,t,k,n,p
	color(8)
	tc=8
	x=80	y=25+idx*8
	m=scn_city.menu_karren
	i=m.i[idx]
 k=data.karren[i.fidx]
 n=k.name

	if k.poi!=nil then
		p=scene.pois[k.poi]
		line(x-2,y+2,p.x,p.y,2)
		tc=11
	end
	if sel then tc=6 end
	print(n,x,y,tc)
	
	return {
	x1=x-2,
	y1=y,
	x2=x+#n*fw,
	y2=y+fh
	}
end

function draw_garage_nav(x,d,idx,sel)
local y,s
	y=110 s=32
	if sel then s=33 end
	spr(s,x,y,1,1,d)
	return {x1=x,y1=y,x2=x+8,y2=y+8}	
end

function	draw_garage_karren_name()
local k
k=data.karren[scn_garage.sk]
print(k.name,84,112,2)
end

function draw_garage_karren_cap()
local k=data.karren[scn_garage.sk]
local cap=data.karren_cap(k)
local cost=data.karren_cost(k)
print("cap : "..cap,10,22,12)
print("cost: "..cost,10,32,12)
end


function draw_hours(x1,x2,y1,y2)
local hx,n,k,v
hx=function(h) return h*(x2-x1)/24+x1 end
n={
	{t="00",v=hx(0)},
	{t="03",v=hx(3)},
	{t="06",v=hx(6)},
	{t="09",v=hx(9)},
	{t="12",v=hx(12)},
	{t="15",v=hx(15)},
	{t="18",v=hx(18)},
	{t="21",v=hx(21)},
	{t="24",v=hx(24)},
}
for k,v in pairs(n) do
line(v.v,y1,v.v,y2,1)
print(v.t,v.v,y2,12)
end

end

function draw_start_tut()
local t = scn_start.tut_text()
if t==nil then return end
y=80
for v in all(t) do
	print(v,hc(v),y,15)
	y+=10
end
end

function draw_pack_menu()
	rect(17,38,111,101,10)
	rectfill(18,39,110,100,15)
	line(18,40+fh,110,40+fh,5)
	local dsb=data.storage.beer*10
	local title="store:"..dsb
	print(title,30,40,1)
	print("X1 X10",70,48)
	local x,y=31,56
	for k,v in pairs(data.karren) do
		print(v.name,x,y,0)
		print(flr(v.b),x+60,y,0)
		y+=8
	end
end

function draw_pack_control(idx,sel)
local x,y,c,t,w,fdx
fidx=menu.i[idx].fidx
x,y = 70,56+(fidx-1)*8
if (idx-1)%2==0 then x+=10 end
c=4
c=4
if sel then c=7 end
t="+"
w=print(t,x,y,c)
circ(x+1,y+2,3,c)

return {
	x1=x-3,y1=y-3,
	x2=x+3+#t,y2=y+3+fh
}
end

function draw_tutorial()
	t={
	{c=8,t="tutorial:"},
	{c=10,t="YOU START WITH 1 WAGON"},
	{c=10,t="LOAD KOELSCH FROM STORAGE"},
	{c=10,t="SEND IT TO THE CITY"}
	}
	
	for k,v in pairs(t) do	
		print(v.t,hc(v.t),80+k*(fh+1),v.c)
	end
end

function draw_cash_check()
	local xoff=20
	local d=data.day-1
	local title="cash check day "..d
	print(title,hc(title),20,7)
	line(xoff,30,106,30,7)
	line(xoff,80,106,80,7)
	line(xoff,92,106,92,7)	
	header="wagon     sales   cost"
	print(header,xoff,34,9)
	line(xoff,41,106,41,9)
	local yoff=44
	local total=0
	for k,v in pairs(data.karren) do
		local income,cost=0,0
 	local cck=data.cashchecks[data.day-1].karren[k]
 	if cck!=nil then
			income=cck.i
			cost=cck.c 
			sold=cck.s
			total+=income
			total-=cost	
 	end
		y=yoff+(k-1)*7
		local ti=tostr(flr(income)).."$"
		local tc=tostr(flr(cost)).."$"
		local ts=tostr(flr(sold))
		print(v.name,xoff,y,7)
		print(ts,xoff+48-#ti*fw,y,11)		
		print(ti,xoff+60-#ti*fw,y,11)
		print(tc,xoff+87-#tc*fw,y,8)
	end
	local tc=11
	if total < 0 then tc=8 end
	local ts=tostr(flr(total)).."$"
	tx=xoff+88
	tx-=#ts*fw
	print("total:",xoff,84,12)
	print(ts,tx,84,tc)
end
-->8
scn_title={
name="",
i=function()
gmenu.v=0
menu={
	y=60,	v=1,	s=1,	c=false,
	i={
		{t="start"},
	},
	cf=function (s)
		if s==1 then 
		scene1()
		gmenu.v=1
		data.ispaused=false
	 end
	end
}
end,
d=function()
	draw_base()
	draw_logo()
	draw_mouse()
	draw_tutorial()
end,
u=function()
	update_menu(menu)
	update_gmenu()	
	update_mouse()
end
}

scn_start={
name="",
i=function()
menu={
	y=20,	v=1,	s=1,	c=false,
	i={
		{t="storage"},
		{t="office"},
		{t="city"},
		{t="garage"},
	},
	cf=function (s)
		if s==1 then scene5() end
		if s==2 then scene3() end
		if s==3 then scene4() end
		if s==4 then scene2() end
	end,
	sc=function()
		scn_start.tut=menu.s
	end
}
end,
tuts={
	{
		"IN THE garage YOU",
		"UPGRADE YOUR KARREN",
		"or BUY NEW ONES!"
	},
	{
		"go into your office",
		"to ANALYZE, RESEARCH or",
		"ADJUST PRICES"
	},
	{
		"assign youR WAGON",
		"TO A platz IN THE CITY",
		"or remove to stop IT",
	},
	{
		"BUY beer",
		"buy STORAGE",
		"WHAT ELSE?"
	},
},
tut_text=function()
if scn_start.tut == nil then return {} end
return scn_start.tuts[scn_start.tut]
end,
d=function()
	draw_base()
	draw_top_bar()
	draw_start_tut()
	draw_mouse()
end,
u=function()
	update_menu(menu)
	update_gmenu()		
	update_mouse()
end
}

scn_garage={
name="garage",
sk=1,
i=function()
menu={
	y=80,	v=1,	s=1,	c=false,
	i={
		{t="upgrade"},
		{t="buy wagon "..data.karren_price().."$"},
		{t="back"},
		{t="",df=function(idx,sel) return draw_garage_nav(76, true ,idx,sel) end},
		{t="",df=function(idx,sel) return draw_garage_nav(115,false,idx,sel) end},
	},
	cf=function (s)
		if s==1 then
			data.upgrade_karren(scn_garage.sk)
			scn_garage.sel(0)
	 end
		if s==2 then 
			data.buy_karren()	
		 end
		if s==3 then scene1() end
		if s==4 then scn_garage.sel(-1) end
		if s==5 then scn_garage.sel(1) end
		menu.c=false
		menu.s=0		
	end
}
	scn_garage.sel(0)
end,
sel=function(d)
	local i
	i=scn_garage.sk
	i+=d
	if i>count(data.karren) then
		scn_garage.sk=1
	elseif i<1 then		
		scn_garage.sk=count(data.karren)
	else
		scn_garage.sk=i		
	end
	menu.c=false
	p=data.upgrade_price(scn_garage.sk)
	menu.i[1].t="upgrade "..p.."$"
end,
d=function()
	draw_base()
	draw_top_bar()
	draw_garage_karren(scn_garage.sk)
	draw_garage_karren_name()
	draw_garage_karren_cap()
	draw_mouse()
end,
u=function()
	update_menu(menu)
	update_gmenu()	
	update_mouse()
end
}

scn_office={
name="office",
i=function()
menu={
 y=100,	v=1,	s=1,	c=false,
	i={
		{t="back"},
		{t="analysis",pos={x=72,y=30}},		
	 {t="dashboard",pos={x=70,y=40}},				
	},
	cf=function (s)
		if s==1 then scene1() end
		if s==2 then scene7() end		
 	if s==3 then scene6() end
	end
}
end,
d=function()
	cls()
	draw_daytime_top()
	draw_main_frame()
	draw_location()
	draw_top_bar()
	draw_office()
	draw_menu(menu)	
	draw_menu(gmenu)		
	draw_mouse()
end,
u=function()
	update_menu(menu)
	update_gmenu()	
	update_mouse()
end
}


scn_city={
name="city",
pois={
{x=40,y=40},
{x=30,y=60},
{x=40,y=80},
},
menu_city={
	y=100,	v=1,	s=0,	c=false,
	i={	
			{t="cancel",h=true},
	},
	cf=function (s)
		if s==1 then 
			mk=scn_city.menu_karren	
			if mk.prev_poi!=nil then 
				ki=mk.i[mk.si]
				data.karren[ki.fidx].poi=nil			
				snd_unassign_karren()
			else
				ki=mk.i[mk.si]
				data.karren[ki.fidx].poi=mk.prev_poi
				snd_unassign_karren()				
			end
			scn_city.sel_karren_menu()
		end
		if s>1 then 
			mk=scn_city.menu_karren
			mc=scn_city.menu_city
			ki=mk.i[mk.si]
			ci=mc.i[s]
			poi=scn_city.pois[ci.fidx]
			k=data.karren[ki.fidx]
			k.poi=ci.fidx
			snd_assign_karren()
			scn_city.sel_karren_menu()
		end
	end
},
menu_karren={
	y=100,	v=1,	s=1,	c=false,
	i={
		{t="back"},
	},
	si=nil,
	cf=function (s)
	 m=scn_city.menu_karren
		if s==1 then scene1() end
		if s>1 then 
			m.si=s
			kidx=m.i[s].fidx
			k=data.karren[kidx]
			m.prev_poi=k.poi			
			k.poi=nil
			scene.sel_city_menu()
		end
	end
},
i=function()
	scn_city.menu_city.c=false
	scn_city.menu_city.i={scn_city.menu_city.i[1]}
	for k,v in pairs(scn_city.pois) do
		add(
		scn_city.menu_city.i,
		{
			t="",
			fidx=k,
			df=draw_city_poi,
		})
	end
	scn_city.menu_karren.c=false
	scn_city.menu_karren.i={scn_city.menu_karren.i[1]}
	for k,v in pairs(data.karren) do
		add(
		scn_city.menu_karren.i,
		{
			t=v.name,
			fidx=k,
			df=draw_city_karren,
		})
	end
end,
sel_karren_menu=function()
			mk=scn_city.menu_karren
			mc=scn_city.menu_city
			scn_city.use_city_menu=false
			mc.i[1].h=true
			mk.i[1].h=false
			mk.c=false
			mk.prev_poi=nil
end,
sel_city_menu=function()
			mk=scn_city.menu_karren
			mc=scn_city.menu_city
			scn_city.use_city_menu=true
			mc.i[1].h=false
			mk.i[1].h=true
			mc.c=false
			mc.s=0
			if mk.prev_poi!=nil then 
				mc.i[1].t="remove"
			else
				mc.i[1].t="cancel"				
			end
end,
d=function()
	s=scn_city
	cls()
	draw_daytime_top()
	draw_main_frame()
	draw_location()
	draw_top_bar()
	draw_city()
	draw_menu(s.menu_city)
	draw_menu(s.menu_karren)
	draw_menu(gmenu)	
	if s.use_city_menu then
		i=s.menu_karren.i[s.menu_karren.si]
		b=i.bounds
		line(b.x1,b.y1+2,mouse_x,mouse_y)
	end
	draw_mouse()
end,
u=function()
	s=scn_city
	if s.use_city_menu then
		update_menu(s.menu_city)
	else	
		update_menu(s.menu_karren)
	end
	update_gmenu()	
	update_mouse()
end
}

scn_storage={
name="storage",
packing=false,
i=function()
	scn_storage.show_main_menu()
end,
d=function()
	cls()
	draw_daytime_top()
	draw_main_frame()
	draw_location()
	draw_top_bar()
	draw_storage()
	if scn_storage.packing then
		draw_pack_menu()
	end
	draw_menu(menu)	
	draw_menu(gmenu)	
	draw_mouse()
end,
u=function()
	update_menu(menu)
	update_gmenu()	
	update_mouse()
end,
show_main_menu=function()
scn_storage.packing=false
menu={
	y=74,	v=1,	s=1,	c=false,
	i={
		{s=nil,t="load wagon"},
		{s=nil,t="buy 10 beer "..data.beer_price().."$"},
		{s=nil,t="buy storage "..data.storage_price().."$"},
		{t="back"},
	},
	cf=function (s)
		if s==1 then scn_storage.show_pack_menu() end
		if s==2 then data.buy_beer(1) end
		if s==3 then data.buy_storage() end
		if s==4 then scene1() end				
		menu.c=false
	end
}
end,
show_pack_menu=function()
	scn_storage.packing=true
	menu={
		y=90,	v=1,	s=1,	c=false,
		i={	},
		cf=function (s)
		 if s>1 then 
			 local kidx=menu.i[s].fidx
			 local amount=menu.i[s].a
			 data.pack_karren(kidx,amount)	
		 end
			if s==1 then	scn_storage.show_main_menu()	end
			menu.c=false
		end
	}
	add(menu.i,{t="back"})
	for k,v in pairs(data.karren) do
		add(menu.i,{s=nil,a=1,fidx=k,df=draw_pack_control})
		add(menu.i,{s=nil,a=10,fidx=k,df=draw_pack_control})		
	end
end
}


scn_dashboard={
name="dashboard",
i=function()
menu={
	y=96,	v=1,	s=1,	c=false,
	i={
		{t="back"},
	},
	cf=function (s)
		if s==1 then scene3() end
		if s>1 and s%2==0 then data.inc_price(s) end
		if s>1 and s%2!=0 then data.dec_price(s) end		
		menu.c=false
	end
}
df=draw_price_control
for k,v in pairs(data.karren)do
	add(menu.i,{t="+",fidx=k,df=df})
	add(menu.i,{t="-",fidx=k,df=df})
end
end,
d=function()
	draw_base()
	draw_top_bar()
	draw_dashboard()
	draw_mouse()
end,
u=function()
	update_menu(menu)
	update_gmenu()	
	update_mouse()
end
}

scn_analysis={
name="analysis",

i=function()
menu={
	y=96,	v=1,	s=1,	c=false,
	i={{t="back"}},
	cf=function (s)
		if s==1 then scene1() end
		if s>1 then 
			local	idx=menu.i[s].fidx
			data.do_research(idx) 
			scn_analysis.update_menu()
		end
		menu.c=false
	end
}
scn_analysis.update_menu()
end,
update_menu=function()
menu.i={menu.i[1]}
local p,t
p=data.research_price()
t="research ("..p.."$)"
for k,v in pairs(data.research) do
	if not data.is_researched(k) then
	add(menu.i,{
		t=t,
		fidx=k,
		pos={x=hc(t),y=16*k+10}
	})
	end
end
end,
d=function()
	cls()
	draw_daytime_top()
	draw_main_frame()
	draw_location()
	draw_top_bar()

	local dm,x,y,xo,yo,xf,yf,m,fm,lm,yoff
	xo=10	yo=20 so=16	  -- offsets
	yf=1 	--xf=0.07 -- plot scales
	fm=0 	lm=1439 -- first/last minute
	dm=data.minutes()
	xmin=xo
	xmax=125-xo
	xf=lm/(xmax-xmin)
	
	draw_hours(xmin,xmax,16,90)
	for k,s in pairs(sim.sims) do
	if data.is_researched(k) then
		yoff=yo+so*k
		print(data.pois[k].name,xmin,yoff-14,10)		
		line(xmin,yoff,xmax,yoff,1)
		for x=0,xmax-xo do
			m=flr(x*xf)
			y=s(m) -- calc
			circfill(x+xmin,yoff-y,0.5,2)		
		end	
		circfill(dm/xf+xmin,yoff-s(dm),1,11)
		end
	end
	draw_menu(menu)
	draw_menu(gmenu)		
	draw_mouse()
end,
u=function()
	update_menu(menu)
	update_gmenu()		
	update_mouse()
end
}

scn_nightly={
name="cash check",
i=function()
gmenu.v=0
data.ispaused=true
menu={
	y=92,	v=1,	s=1,	c=false,
	i={
		{t="continue"},
	},
	cf=function (s)
		if s==1 then 
			scene1()
			data.ispaused=false
			gmenu.v=1
			gmenu.s=0
	 end
	end
}
end,
d=function()
	draw_base()
	draw_top_bar()
	draw_cash_check()
	draw_mouse()
end,
u=function()
	update_menu(menu)
	update_gmenu()		
	update_mouse()
end
}

-->8
mouse = {
		color=10,
		sprite=0,
  init = function()
    poke(0x5f2d, 1)
  end,
  -- return int:x, int:y, onscreen:bool
  pos = function()
    local x,y = stat(32)-1,stat(33)-1
    return stat(32)-1,stat(33)-1
  end,
  -- return int:button [0..4]
  -- 0 .. no button
  -- 1 .. left
  -- 2 .. right
  -- 4 .. middle
  button = function()
    return stat(34)
  end,
}

function draw_mouse()
	spr(mouse.sprite,mouse_x,mouse_y)  
end

function update_mouse()
  mouse_x,mouse_y = mouse.pos()
  mouse_btn = mouse.button()
  
  if mouse_btn==1 then 
  	mouse.sprite=1
  	if mb1d==nil and mbdl==nil then
  	 mb1d=1
  	 mbdl=1
  	end
  else
  	mouse.sprite=0
  	mbdl=nil
  	mb1d=nil
  end 
end

function mouse_down()
	v = mb1d
	if mb1d==1 then mb1d=nil end
	return v==1
end

function menu_item(m,idx,y,sel)
	local x1,x2,item,c,iw
	item=m.i[idx]
	if item.df!=nil then
		item.bounds=item.df(idx,sel)
		return
	end
	if mi_hidden(item) then return end
	iw=#item.t*4
	x1=hc(item.t)
	x2=x1+#item.t*4
	if item.pos != nil then
		x1=item.pos.x
		x2=x1+iw
		y=item.pos.y
	end
	
	c=5
	if sel==true then
		c=7
	end	

	color(c)
	rectfill(x1-2,y-2,x2,y+6)
	color(0)
	print(item.t,x1,y)
	item.bounds={
		x1=x1-2,
		x2=x2,
		y1=y-2,
		y2=y+6
	}		
end

function draw_menu(m)
local y,sel
if m.v!=1 then return end
	y=m.y
	for k,v in pairs(m.i) do
		y=y+10
		sel=k==m.s
		menu_item(m,k,y,sel)
	end
end

function select_menu(m,d)
		snd_menu_select()
		m.s=m.s+d
		if m.s>count(m.i) then
					m.s=1
		end
		if m.s==0 then
					m.s=count(m.i)
		end
		if m.sc!=nil then m.sc() end
end

function confirm_menu(m)
	if m.c then return end
	if m.s==0 then return end
	if m.i[m.s].s!=nil then
		sfx(m.i[m.s].s)
	end
	m.c=true
	m.cf(m.s)
end

function update_menu(m)
	if btnp(⬆️) or btnp(⬅️) then
		select_menu(m,-1)
	end
	if btnp(⬇️) or btnp(➡️) then
		select_menu(m,1)
	end	
	if btnp(🅾️) then
		confirm_menu(m)
	end
	
	handle_menu_mouse(m)
end

function update_gmenu()
	if btnp(❎) then
		gmenu.fastforward()
	end
	handle_gmenu_mouse()
end

function handle_gmenu_mouse()
	if not	handle_menu_mouse(gmenu)	then
		gmenu.s=0
	end
end

function handle_menu_mouse(m)
	local hitem = menu_item_by_point(m.i,mouse_x,mouse_y)
	if hitem != nil then
		local ms=m.s
		m.s=hitem
		if ms!=hitem and m.sc!=nil then m.sc() end
		if mouse_down() then
			confirm_menu(m)
		end
		return true
	end
	
	return false
end

function mi_hidden(i)
	if i.h!= nil and i.h==true then return true end
	return false
end

function menu_item_by_point(i,x,y)
	if mi_hidden(i) then return end
	if x==nil then return end
	for k,v in pairs(i) do
		if v.bounds != nil 
		and x>=v.bounds.x1 
		and x<=v.bounds.x2
		and y>=v.bounds.y1
		and y<=v.bounds.y2
		then 
			return k
		end
	end
	return nil
end

function init_main_menu()
 menuitem(1,"save game",nil)
 menuitem(2,"load game",nil)
 menuitem(3,"exit game",stop)
end
-->8
data={
	minute=11,
	hour=11,
	day=1,
	money=100,
	ispaused=true,
	ishyperspeed=false,
	timespeed=20,
	popularity=0,
	pois={
	{name="EIGELSTEIN"},
	{name="NEUMARKT"},	
	{name="CHLODWIGPLATZ"},	
	},
	caps={
		100,150,200,250,300
	},
	costs={
	  2,5,8,12,15
	},
	storage={
		num=1,
		beer=4,
		bps=15, -- beer per storage
		p=1,
	},
	sellings={
	{s=0},{s=0},{s=0},
	{s=0},	{s=0},
	},
	cashchecks={
		--{karren={{i=12,c=22},{i=0,c=3},{i=4,c=5},{i=6,c=7},{i=8,c=9},}}
		},
	karren={
--	{name="wagon 1",b=100,p=1,poi=nil,u={s=1}},
	{name="wagon 2",b=100,p=1,poi=1,u={s=1}},
	{name="wagon 3",b=100,p=5,poi=1,u={s=1}},
	{name="wagon 4",b=100,p=10,poi=1,u={s=1}},
	{name="wagon 5",b=100,p=7,poi=1,u={s=1}},
	},
	weather=1,
	weather_states=4,
	weather_sprites={
		64,96,104,72
	},
	research={
		{v=1},{v=1},{v=1},
	},
	kp=299,   -- karren price
	init=function()
			data.last = time()
	end,
	update=function()
		data.elapsed=time()-data.last
		data.last = time()
		
		if data.ispaused then return end
		local s=data.timespeed
		if data.ishyperspeed	then
			s=1000
		end
		data.minute+=data.elapsed*s
		if flr(data.minute)>59 then
			data.minute=0
			data.hour+=1
			data.calc_sellings()			
		end
		if data.hour>23 then
			data.hour=0
			data.day+=1
			data.new_weather()
			data.new_beer_price()
			data.ishyperspeed=false
			scene8()			
		end
	end,
	calc_sellings = function()
	local sb,nb,s,p,kc,cc,dm
		for k,v in pairs(data.karren) do
			if v.poi != nil then
				dm=data.demand(v.p)
				sb=sim.sims[v.poi](sim.him(data.hour))
				sb*=0.2
				sb*=dm/100
				nb=mid(0,v.b-sb,v.b+sb)
				s=v.b-nb
				v.b=nb   
				p=v.p*s
				kc=data.karren_cost(v)
								
				data.money+=p
				data.money-=kc
				
				if count(data.cashchecks)<data.day then
					add(data.cashchecks,{karren={}})
				end
				cc=data.cashchecks[data.day]
				if cc.karren[k]==nil then
					cc.karren[k]={i=0,c=0,s=0}
				end
					cc.karren[k].i+=p
					cc.karren[k].c+=kc				
					cc.karren[k].s+=s
			end
		end
	end,
	demand=function(p)
		return	100+-p*10
	end,
	new_beer_price=function()
		data.storage.p=flr(rnd(5)) + 1 
	end,
	new_weather=function()
		data.weather=flr(rnd(data.weather_states)) + 1 
	end,
	weather_sprite=function()
		local v,qv,spd,s
		spd=4  --sprite per day
		s=2    -- quantize steps
		v=data.hour/spd
		qv=s * flr(v / s + 0.5)
		return	data.weather_sprites[data.weather]+qv
	end,
	pack_karren=function(idx,b)
		local k,nb,c,ab,kb
		if b>data.storage.beer then
			b=data.storage.beer
		end
		kb=b*10
		k=data.karren[idx]	
		c=data.karren_cap(k)
		if k.b==c then		return 		end
		nb=mid(b,k.b+kb,c) -- new beers
		ab=nb-k.b 									-- added beer
		k.b=nb
		data.reduce_beer(b)
	end,
	karren_cap=function(k)
		return data.caps[k.u.s]
	end,
	karren_cost=function(k)
		return data.costs[k.u.s]
	end,
	minutes=function()
		return data.hour*60+data.minute
	end,
	new_karren=function(kc)
		return {name="wagon "..kc+1,b=0,p=1,poi=nil,u={s=1,mb=2}}
	end,
	inc_price=function(idx)
		k=data.karren[menu.i[idx].fidx]
		k.p+=1
		snd_change_price()
	end,
		dec_price=function(idx)
		k=data.karren[menu.i[idx].fidx]
		new=k.p-1
		if new<0 then snd_deny() return end
		k.p-=1
		snd_change_price()
		end,	
	is_researched=function(idx)
		return data.research[idx].v==100
	end,
	upgrade_karren=function(idx)
		local k,price
		k=data.karren[idx]
		if k.u.s==4 then return end
		price=data.upgrade_price(idx)
		if not data.can_pay(price) then return end
		k.u.s+=1
		snd_upgrade()
		data.pay(price)
	end,
	do_research=function(idx)
		local s,price
		price=data.research_price()
		if not data.can_pay(price) then return end
		data.research[idx].v=100
		data.pay(price)	
	end,
	buy_beer=function(amount)
		local s,price,new
		s=data.storage
		new=s.beer+amount
		if new > s.bps * s.num then	snd_deny() return end
		price=data.beer_price()*amount
		if not data.can_pay(price) then return end
		s.beer=new
		data.pay(price)
	end,
	reduce_beer=function(amount)
		nb=mid(0,data.storage.beer-amount,data.storage.beer)
		data.storage.beer=nb
	end,
	buy_storage=function ()
		local price
		if data.storage.num==6 then	snd_deny() return end
		price=data.storage_price()
		if not data.can_pay(price) then return end
		data.storage.num+=1
		data.pay(price)
	end,
	buy_karren=function()
		local kc,price
		kc=count(data.karren)
		if kc==5 then	snd_deny() return end
		price=data.karren_price()
		if not data.can_pay(price) then return end
		add(data.karren,data.new_karren(kc))
		data.pay(price)		
	end,
	karren_price=function()
		return data.kp
	end,
	upgrade_price=function(idx)
		local k
		k=data.karren[idx]
		return k.u.s*20
	end,
	beer_price=function()
		return data.storage.p
	end,
	research_price=function()
		return 300
	end,	
	storage_price=function()
		return 100
	end,
	can_pay=function(amount)
		local can
		can=data.money-amount>=0
		if can then return true end
		snd_deny()
		return false
	end,
	pay=function(amount)
		data.money-=amount
		snd_buy()
	end
}

-->8
function snd_deny()
	sfx(4)
end
function snd_buy()
		sfx(5)
end
function snd_upgrade()
		sfx(3)
end
function snd_menu_select()
		sfx(0)
end
function snd_assign_karren()
	sfx(7)
end
function snd_unassign_karren()
	sfx(8)
end
function snd_change_price()
	sfx(6)
end
-->8
sim={
	lm=1439,	-- max minute (1440 minutes per day)
	f=10,	-- general factor
	sims={
	function(m)
		local i,f,v,xf,p,w
		w=data.weather
		p=data.popularity	
		xf=1
		if m>=sim.him(21) or m<=sim.him(2) then
			xf=5
		end
		if m>sim.him(3) and m<sim.him(20) then
			xf=-1
		end

		i=m/sim.lm+0.25
		f=p+w+xf+sim.f
		v=abs(sin(i))
		return v*f
	end,
	function(m)
		local i,f,v,xf,p,w
		w=data.weather
		p=data.popularity
		xf=1
		if m>=sim.him(9) and m<=sim.him(15) then
			xf=3
		end
		
		i=m/sim.lm+0
		f=p+w+xf+sim.f
		v=abs(sin(i))		
		return v*f
	end,
	function(m)
		local i,f,v,p,w
		w=data.weather
		p=data.popularity
		i=m/sim.lm+0.1
		f=p+w+sim.f
		v=abs(sin(i))		
		return v*f
	end
 },
 him=function(h) -- hour in minutes
	 return h*60
 end
}



-->8
gmenu={
	y=0,	v=1,	s=0,	c=false,
	i={
		hyperspeed={
			t="fast forward",
			df=function(idx,sel)
				local s=34
				if sel then
					s=35
				end
				spr(s,55,6)
				return {x1=55,y1=6,x2=55+8,y2=6+8}
			end,
		},
	},
	cf=function (s)
		if s=="hyperspeed" then 
			gmenu.fastforward()
	 end
	 gmenu.s=0
	 gmenu.c=false
	end,
	fastforward=function()
		if gmenu.v!=1 then return end
		data.ishyperspeed=true
	 gmenu.v=0	 		
	end
}

__gfx__
77000000000000008000800000000000000000000000000000000000000000000000000000000000000000000000000000000000005554440000011110000000
aa000000007700008000800000000000000000000000000000000000000000000000000000000000000000000000000000000000054444440111122221111000
aa000000077aa0008000800000000000088880088880000000000000000000000000000000000000000880080000000000000000544444441222252522222100
aa00000000aaaa008000800000000000887770087770000808888880800000800888000000000000000888080000000000000005444444441255555555552100
aa000000000aaaa08008780080080000780000080000800806687770880008808777000888800000000878080000000000000054444444441252525252522100
aa0000000000aaaa8008770070080000880000080000800800080000788088788000000877788088800808080000000000000544444444441255555555552100
0000000000000aa08087008800080000780000088000808800080000078887087000008800088087880808080000000000005444444444441225252525252100
00000000000000008870087780080000080088878000888800080000078870080000008700087870780808080000000000054444444444441255555555552100
00000000000000008700870078080000088887808000877800080000007800080000008000080800080808080000000000544444444444441252525252522100
00077000000000008000800008080000077770808000880800080000000800080000008800880800080808080000000005444444444444441255555555552100
000aa000000000008800780087080000000000808000780800080000000800078000007888870800880808080000000054444444444444441225252525252100
000aa000000000008780078870080000000000808000070700080000000800008000000777700888870808080000000054444444444444441255555555552100
000aa000000000008778007700080000000000808008000000080000000800008000880000000777700808880000000000000000000000001222222222222100
000aa000000000008778000000080000088888808888000000070000000800007888870000000000000707770000000000000000000000000111116611110000
000aa000000000008778000000088880077777707777000000000000000700000777700000000000000000000000000000000000000000000012226622210000
00000000000000008707800000077770000000000000000000000000000000000000000000000000000000000000000000000000000000000122226622221000
00070000000c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001222226622222100
000670000001c00056006500870078000000000000000000000000000000000000000000000000000000000000000000000000000000000001555d66d5551000
0000670000001c00056006500870078000000000000000000000000000000000000000000000000000000000000000000dddddddddddddd00011116611110000
00000670000001c0005600650087007800000000000000000000000000000000000000000000000000000000000000000dd5555555555dd00000016610000000
00000670000001c0056006500870078000000000000000000000000000000000000000000000000000000000000000000d555995599555d000011d66d1100000
0000670000001c00560065008700780000000000000000000000000000000000000000000000000000000000000000000d5555aaaa5555d00015665566510000
000670000001c000000000000000000000000000000000000000000000000000000000000000000000000000000000000dd5555555555dd00001111111100000
00070000000c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddddddddd00000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddddddddd00000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dd5555555555dd00000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d555995599555d00000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d5555aaaa5555d00000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dd5555555555dd00000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddddddddd00000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000111111111011110011111111101111001111111110111100111111111011110
000000000000000000900900a0000a0000000000000000000000000000000000066661111aa99a01066661111aa99a01066661111aa99a01066661111aa99a01
000000000000000000090aa0a0009000111111111111111100000000000000000661666199999001066166619999900106616661999990010661666199999001
000000000000000000090900000a00001111222222211111000000000000000001616669a99aa61101616669a99aa61101616669a99aa61101616669a99aa611
0000aaa9aa000000000aaaa9aa0000a01112888828211111000066666660000000066aa99996606600066aa99996606600066aa99996606600066aa999966066
000a999999a0000000009a9777a09a00122888888822222100066556666000000005a9999a6606000005a9999a6606000005a9999a6606000005a9999a660600
00a99999999a00000a997a7a979a0000222899999882222100066556566600000005a999906160000005a999906160000005a999906160000005a99990616000
00a9999999970000000a7a7a7aa7000022289aaa9982222200066666655600000005555a9aaa66000005555a9aaa66000005555a9aaa66000005555a9aaa6600
00a99999999a0000a90a97a7aa9aaaa022889aaaaa92222200066665556600000000559999906100000055999990610000005599999061000000559999906100
00099999999a000009a9aaa797a9000022289aaaaa98222200066565666600000a005999991550000a005999991550000a005999991550000a00599999155000
000a9999999a000000007a97779a0000222899aaaa98222200066666666600000a0199999a5550000a0199999a5550000a0199999a5550000a0199999a555000
0000a9999aa00000000aa9aa9a00a000222289999998222200006666666000000aaa9995555a10000aaa9995555a10000aaa9995555a10000aaa9995555a1000
00000aaaa000000000a9009009000a002222288888822222000000000000000000a999a00aa1100000a999a00aa1100000a999a00aa1100000a999a00aa11000
0000000000000000090000a00a0000a02222222222222222000000000000000000aaa9aaa001000000aaa9aaa001000000aaa9aaa001000000aaa9aaa0010000
0000000000000000000000a0009000002222222222222222000000000000000000aaaaaa0000000000aaaaaa0000000000aaaaaa0000000000aaaaaa00000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000001111111111111111111111111111111111111111111111111111111111111111
0000000000000000000000000000000000000000000000000000000000000000dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
07770677700777700777067770077770077706777007777007770677700777706655555555555555665555555555555566555555555555556655555555555555
00066666000000000006666600000000000666660000000000066666000000000767766666666666076776666666666607677666666666660767766666666666
00666666077706600066666607770660006666660777066000666666077706600000010007766770000001000776677000000100077667700000010007766770
07777776777777700777777677777770077777767777777007777776777777700000100000000000000010000000000000001000000000000000100000000000
77777777667777607777777766777760777777776677776077777777667777600000100000011000000010000001100000001000000110000000100000011000
77777777667776607777777766777660777777776677766077777777667776600001100010010010000110001001001000011000100100100001100010010010
07777777666666600777777766666660077777776666666007777777666666600001000000000110000100000000011000010000000001100001000000000110
00666666777777600066666677777760006666667777776000666666777777600010000000110000001000000011000000100000001100000010000000110000
00000067777777600000006777777760000000677777776000000067777777600000001000000000000000100000000000000010000000000000001000000000
00077777777777600007777777777760000777777777776000077777777777600000011000100000000001100010000000000110001000000000011000100000
00777777777776000077777777777600007777777777760000777777777776000100000000100000010000000010000001000000001000000100000000100000
00000007777700000000000777770000000000077777000000000007777700000100011100001000010001110000100001000111000010000100011100001000
07777000000000000777700000000000077770000000000007777000000000000100000001010000010000000101000001000000010100000100000001010000
__label__
07700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007700
77aa99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999aa770
0aaaaccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc1111111111111111ccccccccccccccccccccccccccccccccccccaaaa90
09aaaacccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc1111222222211111cccccccccccccccccccccccccccccccccccaaaac90
09caaaaccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc1112888828211111ccccccccccccccccccccccccccccccccccaaaacc90
09ccaacccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc1228888888222221cccccccccccccccccccccccccccccccccccaaccc90
09cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc2228999998822221cccccccccccccccccccccccccccccccccccccccc90
09cccc99cc999c9c9ccccc99cccccc99cc999ccccc999c999ccccccccccccccccccccc22289aaa99822222ccccccccccccccccccbbbcbbbcbbbcbbbccccccc90
09cccc9c9c9c9c9c9cc9ccc9ccccccc9cccc9cc9cccc9ccc9ccccccccccccccccccccc22889aaaaa922222ccccccccccccccccccbcbcbcbcbcbcbbcccccccc90
09cccc9c9c999c999cccccc9ccccccc9cc999ccccc999cc99ccccccccccccccccccccc22289aaaaa982222ccccccccccccccccccbbbcbcbcbcbccbbccccccc90
09cccc9c9c9c9ccc9cc9ccc9ccccccc9cc9cccc9cc9ccccc9ccccccccccccccccccccc222899aaaa982222ccccccccccccccccccccbcbcbcbcbcbbbccccccc90
09cccc999c9c9c999ccccc999ccccc999c999ccccc999c999ccccccccccccccccccccc2222899999982222ccccccccccccccccccccbcbbbcbbbccbcccccccc90
09cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc2222288888822222cccccccccccccccccccccccccccccccccccccccc90
09cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc2222222222222222cccccccccccccccccccccccccccccccccccccccc90
09cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc2222222222222222cccccccccccccccccccccccccccccccccccccccc90
09999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999990
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000bb0b0000bb0bbb0bbb00000bb000bb0bbb0bbb00000000000000000bb00bbb0bbb0bb000000000000000bb0bb00bbb00bb0bbb000000000000000090
0900000b0b0b000b0b00b0000b00000b0b0b0b0bbb0bb000000000000000000bb00bb00bb00b0b0000000000000b0b0b0b00b00b000bb0000000000000000090
0900000bbb0b000bbb00b00b0000000b0b0bbb0b0b0b0000000000000000000b0b0b000b000bb00000000000000bbb0bb000b00b000b00000000000000000090
0900000b0000bb0b0b00b00bbb00000b0b0b0b0b0b00bb00000000000000000bbb00bb00bb0b0b0000000000000b000b0b0bbb00bb00bb000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001110000011100000000090
09000000000000080000000000606066606660666066606600000066000000008880008088008880888000000000006600666000010001000100010000000090
09000000000000888000000000606060606060606060006060000006000000008080080008008080808000000000000600660000100100101000001000000090
09000000000008888800000000660066606600660066006060000006000000008080080008008080808000000000000600066000101110101011101000000090
09000000000000888000000000606060606060606060006060000006000000008080080008008080808000000000000600666000100100101000001000000090
09000000000000080000000000606060606060606066606060000066600000008880800088808880888000000000006660060000010001000100010000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001110000011100000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
0900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ddd0000011100000000090
090000000000000b00000000006060666066606660666066000000666000000088800080880088808880000000000066006660000d000d000100010000000090
09000000000000bbb000000000606060606060606060006060000000600000008080080008008080808000000000000600660000d00700d01000001000000090
0900000000000bbbbb00000000660066606600660066006060000066600000008080080008008080808000000000000600066000d07770d01011101000000090
09000000000000bbb000000000606060606060606060006060000060000000008080080008008080808000000000000600666000d00700d01000001000000090
090000000000000b00000000006060606060606060666060600000666000000088808000888088808880000000000066600600000d000d000100010000000090
0900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ddd0000011100000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001110000011100000000090
090000000000000b000000000060606660666066606660660000006660000000bbb000b0bb00bbb0bbb000000000006600666000010001000100010000000090
09000000000000bbb00000000060606060606060606000606000000060000000b0b00b000b00b0b0b0b000000000000600660000100100101000001000000090
0900000000000bbbbb0000000066006660660066006600606000000660000000bbb00b000b00b0b0b0b000000000000600066000101110101011101000000090
09000000000000bbb0000000006060606060606060600060600000006000000000b00b000b00b0b0b0b000000000000600666770100100101000001000000090
090000000000000b00000000006060606060606060666060600000666000000000b0b000bbb0bbb0bbb000000000006660060aa0010001000100010000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000aa0001110000011100000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000aa0000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000aa0001110000011100000000090
090000000000000b000000000060606660666066606660660000006060000000bbb000b0bb00bbb0bbb000000000006600666aa0010001000100010000000090
09000000000000bbb00000000060606060606060606000606000006060000000b0b00b000b00b0b0b0b000000000000600660000100100101000001000000090
0900000000000bbbbb0000000066006660660066006600606000006660000000bbb00b000b00b0b0b0b000000000000600066000101110101011101000000090
09000000000000bbb0000000006060606060606060600060600000006000000000b00b000b00b0b0b0b000000000000600666000100100101000001000000090
090000000000000b00000000006060606060606060666060600000006000000000b0b000bbb0bbb0bbb000000000006660060000010001000100010000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001110000011100000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001110000011100000000090
090000000000000b000000000060606660666066606660660000006660000000bbb000b0bb00bbb0bbb000000000006600666000010001000100010000000090
09000000000000bbb00000000060606060606060606000606000006000000000b0b00b000b00b0b0b0b000000000000600660000100100101000001000000090
0900000000000bbbbb0000000066006660660066006600606000006660000000bbb00b000b00b0b0b0b000000000000600066000101110101011101000000090
09000000000000bbb0000000006060606060606060600060600000006000000000b00b000b00b0b0b0b000000000000600666000100100101000001000000090
090000000000000b00000000006060606060606060666060600000666000000000b0b000bbb0bbb0bbb000000000006660060000010001000100010000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001110000011100000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
0900000000000000000000000000000000000000fffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
090000000000fff00ff0fff0f0f0f000fff0fff0fff0fff0f0f000000000fff00000000000000000000000000000000000000000000000000000000000000090
090000000000f0f0f0f0f0f0f0f0f000f0f0f0f00f000f00f0f00f000000f0f00000000000000000000000000000000000000000000000000000000000000090
090000000000fff0f0f0fff0f0f0f000fff0ff000f000f00fff000000000f0f00000000000000000000000000000000000000000000000000000000000000090
090000000000f000f0f0f000f0f0f000f0f0f0f00f000f0000f00f000000f0f00000000000000000000000000000000000000000000000000000000000000090
090000000000f000ff00f0000ff0fff0f0f0f0f0fff00f00fff000000000fff00000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
70000000000000000000000070007000077777000777770077777770000700000777770000700000007770007777777007777700700000700000000070707070
07000000000000007000700000700070770077700077700077777770007770007700077000777700077707000000000077070770777777707070000007070700
00700000707070700707070070007000770007700007000077777770777777707700077000777000077777007777777077707770707770700700707070707070
07000000000000000070007000700070770077700077700077777770077777007770777007777000077777000000000077070770707770700000070007070700
70000000000000000000000070007000077777000777770077777770070007000777770000007000007770007777777007777700077777000000000070707070
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000707070700777770000777000077777000007000007707700007770000077700007777700000777007777777000000000000000000000000070707070
00000000707070707770777007707700770007700077700007777700007770000777770077700770000700007077707007000700000000000700070070707070
00000000707070707700077077707770770707700777770007777700077777007777777077000770000700007777777000000000000000000000000070707070
00000000707070707700077007707700770007700077700000777000007770000707070077700770077700007000007007000700000000000700070070707070
00000000707070700777770000777000077777000007000000070000007070000707770007777700077700007777777070000000777077707000000070707070
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000070000007770070007007770070007000700070007000700070070707070077777008888000000000000000000000000000000000000000000000090
00000000700077700070700070000070007000700070007000700070007007070700770077708888000000000000000000000000000000000000000000000090
00000000700000000770700000000770000000000000000000000000000070707070770007708888000000000000000000000000000000000000000000000090
00000000700077700000700000000000000000000000000000000000000007070700770077708888000000000000000000000000000000000000000000000090
00000000070000000700070000000700000000000000000000000000000070707070077777008888000000000000000000000000000000000000000000000090
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000055050505050555050550000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000055000505055005050550000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000055555555555555555550000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000055555555555555555550000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000011001110011010101110011011101110110022222220000000000000000000000000000000000000000000000000000000000000000000000000000090
09000010101010100010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000010101110111011101100101011101100101022222220000000000000000000000000000000000000000000000000000000000000000000000000000090
09000010101010001010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000011101010110010101110110010101010111022222220000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090
09999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999990
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

__sfx__
000100001401014010110100101000000010000000000000010000200002000020000200002000020000200002000030000000004000040000000003000030000200002000020000200000000000000000000000
000100000b0100d0100d0100e0100e0100e0100901005010010000100007000010000100000000030000000002000020000100000000020000000000000000000000000000000000000000000000000000000000
0002000012050190501e05020050240501d0001000021000290001d0001e00020000200002005025050240502c050260503005029000270001e0001e00000000000000000000000260502b0502e050320502f050
000100000d1500e1500e1500e1500f1500f1501015011150111501215013150151501515016150171501815019150191501b1501b1501d1501e1501f1502015021150231502615027150291502b1502d15031150
0003000000000074500745007450074501a4001840014400054500545005450054500545005450000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00010000000001a7501e7501f7501f7502175023750207501f7501b750117500a7500575025300263000075003750097500d75013750197501d750207502b750307502e700357502070025700377500d70000700
000300003075028700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000100001a5501a5501a5501a55001500005002150020500295002c0502c5502c0500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000100000000030750307502e7502d7402d7302d7302c720257100000000000000000000000000000000000012710127101175010720107500f75000000000000d7000e7000e7000f7000f7000f7000e7000e700
000200002370023700237002370000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000c000024150230002415024000221501870021150211502115021150241502415021150211501f1501f15021150211501f1501f1501d1501d1501d1501d1502470022700257002670027700287002670008700
001000001815019100000001d1501d1501d15000000000001815000000000001d1501d1501d15000000000001815000000000001d1501d1501d150106001f600166000a60018600176001560012600116000d600
__music__
00 15424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
04 0a424344

