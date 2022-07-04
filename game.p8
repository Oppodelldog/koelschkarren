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

function _init()
 init_main_menu()
	data.init()
 mouse.init()
 scene3()
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
local x,y,h,m,mw
x=6 y=7
h=tostr(data.hour)
m=tostr(flr(data.minute))
if data.hour < 10 then h="0"..h end
if data.minute < 10 then m="0"..m end
color(9)
print("day:"..data.day.." "..h..":"..m,x,y)

m=tostr(data.money).."$"
mw=#m*fw
color(11)
print(m,120-mw,y)
end

function draw_logo()
spr(2,50,26,4,2)
spr(6,50,46,4,2)
end

function pl(p1,p2)
line(p1.x, p1.y, p2.x,p2.y) 
end

function draw_grage_karren(idx)
local k,x,y,p1,p2,p3,p4,p5,wr
k=data.karren[idx]
color(8)
-- offset
x=44
y=60
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
rect(64,23,105,63,5)
rectfill(65,24,104,62,6)
line(65+19,62,65,80,6)
line(65+19,62,100,80,6)
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
	local k,v,y,poi_c,beer_c,c
	print("PLATZ NAME    BEER   PRICE",7,20)
	for k,v in pairs(data.karren) do
		y=k*8+24
		poi_c=8
		beer_c=8
		c=6
		if v.poi!=nil then poi_c=11 end
		if v.b>0 then beer_c=11 end		
		print("◆",12,y,poi_c)
		print(v.name,26,y,c)
		print(v.b.."/"..v.u.mb,64,y,beer_c)
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
	local mi,poi,r,c
	mi=scene.menu_city.i[idx]
	poi=scene.pois[mi.fidx]
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
	tc=5
	if sel then tc=6 end
	x=80	y=25+idx*8
	m=scn_city.menu_karren
	i = m.i[idx]
 k = data.karren[i.fidx]
 n=k.name
	print(n,x,y,tc)
	if k.poi!=nil then
		p=scene.pois[k.poi]
		line(x-2,y+2,p.x,p.y,2)
	end
	
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

-->8
scn_title={
name="",
i=function()
menu={
	y=60,	v=1,	s=1,	c=false,
	i={
		{t="start"},
		{t="quit"}
	},
	cf=function (s)
		if s==1 then scene1() end
		if s==2 then stop() end		
	end
}
end,
d=function()
	draw_base()
	draw_logo()
	draw_mouse()
end,
u=function()
	update_menu(menu)
	update_mouse()
end
}

scn_start={
name="",
i=function()
menu={
	y=20,	v=1,	s=1,	c=false,
	i={
		{t="garage"},
		{t="office"},
		{t="city"},
		{t="storage"},
		{t="dashboard"},
	},
	cf=function (s)
		if s==1 then scene2() end
		if s==2 then scene3() end
		if s==3 then scene4() end
		if s==4 then scene5() end
		if s==5 then scene6() end						
		
	end
}
end,
d=function()
	draw_base()
	draw_top_bar()
	draw_mouse()
end,
u=function()
	update_menu(menu)
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
		{t="buy karren "..data.karren_price().."$"},
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
	draw_grage_karren(scn_garage.sk)
	draw_garage_karren_name()
	draw_mouse()
end,
u=function()
	update_menu(menu)
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
		{t="analysis",pos={x=70,y=30}},		
	},
	cf=function (s)
		if s==1 then scene1() end
		if s==2 then scene7() end		
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
	draw_mouse()
end,
u=function()
	update_menu(menu)
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
			else
				ki=mk.i[mk.si]
				data.karren[ki.fidx].poi=mk.prev_poi
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
	update_mouse()
end
}

scn_storage={
name="storage",
i=function()
menu={
	y=80,	v=1,	s=1,	c=false,
	i={
		{s=nil,t="buy beer "..data.beer_price().."$"},
		{s=nil,t="buy storage "..data.storage_price().."$"},
		{t="back"},
	},
	cf=function (s)
		if s==1 then data.buy_beer(1) end
		if s==2 then data.buy_storage() end
		if s==3 then scene1() end				
		menu.c=false
	end
}
end,
d=function()
	draw_base()
	draw_top_bar()
	draw_storage()
	draw_mouse()
end,
u=function()
	update_menu(menu)
	update_mouse()
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
		if s==1 then scene1() end
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
	draw_mouse()
end,
u=function()
	update_menu(menu)
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
	if item.df!=nil then
		item.bounds=item.df(idx,sel)
	else
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
end

function confirm_menu(m)
	if m.c then return end
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
	
	hitem = menu_item_by_point(m.i,mouse_x,mouse_y)
	if hitem != nil then
		m.s=hitem
		if mouse_down() then
			confirm_menu(m)
		end
	end
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
	money=900,
	timespeed=10,
	popularity=0,
	storage={
		num=1,
		beer=4,
		bps=15, -- beer per storage
	},
	karren={
	{name="karren 1",b=10,p=1,poi=nil,u={s=1,mb=10}},
	{name="karren 2",b=0,p=1,poi=1,u={s=1,mb=8}},
	{name="karren 3",b=10,p=1,poi=2,u={s=1,mb=10}},
	{name="karren 4",b=10,p=1,poi=2,u={s=1,mb=10}},
	{name="karren 5",b=10,p=1,poi=2,u={s=1,mb=10}},
	},
	research={
		{v=0},{v=0},{v=0},
	},
	init=function()
			data.last = time()
	end,
	update=function()
		data.elapsed=time()-data.last
		data.last = time() 
		data.minute+=data.elapsed*data.timespeed
		if flr(data.minute)>59 then
			data.minute=0
			data.hour+=1
		end
		if data.hour>23 then
			data.hour=0
			data.day+=1
		end
	end,
	minutes=function()
		return data.hour*60+data.minute
	end,
	new_karren=function()
		return {name="karren "..kc+1,b=0,p=1,poi=nil,u={s=1,mb=2}}
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
		add(data.karren,data.new_karren())
		data.pay(price)		
	end,
	karren_price=function()
		return 299
	end,
	upgrade_price=function(idx)
		local k
		k=data.karren[idx]
		return k.u.s*20
	end,
	beer_price=function()
		return 1
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
function snd_change_price()
	sfx(6)
end
-->8
sim={
	w=-5, 			-- positive/negative weather
	pop=10,		-- popularity (0..n)
	lm=1439,	-- max minute (1440 minutes per day)
	sims={
	function(m)
		local i,f,v,xf		
		xf=1
		if m>=sim.him(21) or m<=sim.him(2) then
		xf=5
		end
		if m>sim.him(3) and m<sim.him(20) then
		xf=-1
		end

		i=m/sim.lm+0.25
		f=sim.pop+sim.w+xf
		v=abs(sin(i))
		return v*f
	end,
	function(m)
		local i,f,v,xf
		xf=1
		if m>=sim.him(9) and m<=sim.him(15) then
		xf=3
		
		end
		
		i=m/sim.lm+0
		f=sim.pop+sim.w+xf
		v=abs(sin(i))		
		return v*f
	end,
	function(m)
		local i,f,v
		i=m/sim.lm+0.1
		f=(sim.pop+sim.w)
		v=abs(sin(i))		
		return v*f
	end
 },
 him=function(h) -- hour in minutes
	 return h*60
 end
}



__gfx__
77000000000000008000800000000000000000000000000000000000000000000000000000000000000000000000000000000000005554440000011110000000
aa000000007700008000800000000000000000000000000000000000000000000000000000000000000000000000000000000000054444440111122221111000
aa000000077aa0008000800000000000088880088880000000000000000000000000000000000000000000000000000000000000544444441222252522222100
aa00000000aaaa008000800000000000880000080000000800000000000000000000000000000000000000000000000000000005444444441255555555552100
aa000000000aaaa08008080080080000080000080000800800000800080008880000000088888800000000000000000000000054444444441252525252522100
aa0000000000aaaa8008000000080000880000080000800808008800888008088888880088000000000000000000000000000544444444441255555555552100
0000000000000aa08080008800080000080000088000808808008000808008088800080008000000000000000000000000005444444444441225252525252100
00000000000000008800080080080000080088808000888800888000808808880800008008888800000000000000000000054444444444441255555555552100
00000000000000008000800008080000088880808000800800880008888808800800008008000000000000000000000000544444444444441252525252522100
00077000000000008000800008080000000000808000880800888008008008800808880008000000000000000000000005444444444444441255555555552100
000aa000000000008800080080080000000000808000080800808008008808080888800008000000000000000000000054444444444444441225252525252100
000aa000000000008080008800080000000000808000000000800800000808080080880000800000000000000000000054444444444444441255555555552100
000aa000000000008008000000080000000000808008000000000000000800000080080000888800000000000000000000000000000000001222222222222100
000aa000000000008008000000080000088888808888000000000000000000000080088000000000000000000000000000000000000000000111116611110000
000aa000000000008008000000088880000000000000000000000000000000000000000000000000000000000000000000000000000000000012226622210000
00000000000000008000800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000122226622221000
00070000000c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001222226622222100
000670000001c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001555d66d5551000
0000670000001c00000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddddddddd00011116611110000
00000670000001c0000000000000000000000000000000000000000000000000000000000000000000000000000000000dd5555555555dd00000016610000000
00000670000001c0000000000000000000000000000000000000000000000000000000000000000000000000000000000d555995599555d000011d66d1100000
0000670000001c00000000000000000000000000000000000000000000000000000000000000000000000000000000000d5555aaaa5555d00015665566510000
000670000001c000000000000000000000000000000000000000000000000000000000000000000000000000000000000dd5555555555dd00001111111100000
00070000000c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddddddddd00000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddddddddd00000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dd5555555555dd00000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d555995599555d00000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d5555aaaa5555d00000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dd5555555555dd00000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddddddddddddd00000000000000000
__sfx__
000100001401014010110100101000000010000000000000010000200002000020000200002000020000200002000030000000004000040000000003000030000200002000020000200000000000000000000000
000100000b0100d0100d0100e0100e0100e0100901005010010000100007000010000100000000030000000002000020000100000000020000000000000000000000000000000000000000000000000000000000
0002000012050190501e05020050240501d0001000021000290001d0001e00020000200002005025050240502c050260503005029000270001e0001e00000000000000000000000260502b0502e050320502f050
000100000d1500e1500e1500e1500f1500f1501015011150111501215013150151501515016150171501815019150191501b1501b1501d1501e1501f1502015021150231502615027150291502b1502d15031150
0003000000000074500745007450074501a4001840014400054500545005450054500545005450000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00010000000001a7501e7501f7501f7502175023750207501f7501b750117500a7500575025300263000075003750097500d75013750197501d750207502b750307502e700357502070025700377500d70000700
000300003075028700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000100001a5501a5501a5501a55001500005002150020500295002c0502c5502c0500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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

