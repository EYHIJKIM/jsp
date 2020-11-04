
function nameInput() {
	name = prompt('당신의 이름은?')
}

function addrInput(){
	address=prompt('당신의 주소는?')
}

function ageInput(){
	age=prompt('당신의 나이는?')
}



imgList = ['최근상품01.jpg','최근상품02.jpg','최근상품03.jpg','최근상품04.jpg',
'최근상품05.jpg','최근상품06.jpg','최근상품07.jpg','최근상품08.jpg']
path = '../CSS/resources/images/'
idx=0

function previous(){
		if(idx==0){
			idx = 7
		} else{
			idx -=1;
		}
		
		document.getElementById('img').src = path+imgList[idx]
	}


function next(){
		
		if(idx==7){
			idx = 0
		} else{
			idx +=1;
		}
		
		document.getElementById('img').src = path+imgList[idx]
	}
	
