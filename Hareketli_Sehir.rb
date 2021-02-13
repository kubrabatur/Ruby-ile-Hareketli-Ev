# Default code, use or delete

@mod = Sketchup.active_model
@ent = @mod.entities
@sel = @mod.selection
@view=@mod.active_view
@dizi=Array.new(5){Array.new(5)}
@s=100.inch
@w=60.inch
@beta =0.01
def sehri_olustur()
n = 5
(0..n-1).each{|i|
(0..n-1).each{|j|
pts=[]

pts[0] = [i*@s,j*@s,0]
pts[1] = [i*@s,j*@s+@w,0]
pts[2] = [i*@s+@w,j*@s+@w,0]
pts[3] = [i*@s+@w,j*@s,0]

group=@ent.add_group
face=group.entities.add_face pts
face.back_material = [200,(255/(n)*j).round,(255/(n)*i).round]
face.pushpull -40
@dizi[i][j]=group
}
}

end 

def animasyon()
(0..100).each { |k|
(0..4).each { |i|
(0..4).each { |j|
yukseklik = Math.cos(@beta*(((i+k)*(i))+((j*k)*(j))))*2.5
scale_transformation = Geom::Transformation.scaling(1,1,yukseklik)
@dizi[j][i].transformation=scale_transformation
@dizi[j][i].transform!(scale_transformation)
}
}
sleep 0.05
@view.refresh
#sleep 0.05
}
end


sehri_olustur()
animasyon()
