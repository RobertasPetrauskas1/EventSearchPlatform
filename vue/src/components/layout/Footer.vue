<template>
  <div>
      <footer>
        <div class="footer-top">
            <div class="container">
                <div class="row ">
                    <div class="col-md-4 col-sm-6 col-xs-12 segment-two md-mb-30 sm-mb-30">
                        <h2>Information</h2>
                        <ul>
                            <li><a href="#">FAQ</a></li>
                            <li><a href="#">Contacts</a></li>
                        </ul>
                    </div>
                    <div class="col-md-4 col-sm-6 col-xs-12 segment-three sm-mb-30">
                        <h2>Follow Us</h2>
                        <p>Connect with us through social media</p>
                        <a href="#"><i class="fab fa-facebook-square"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                    <div class="col-md-4 col-sm-6 col-xs-12 segment-four sm-mb-30">
                        <h2>Our Newsletter</h2>
                        <p>Subscribe to our page to be the first one informed of any new upcoming events</p>
                        <form action="">
                            <input type="email">
                            <input type="submit" value="Subscribe">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <p class="footer-bottom-text"> All Right Reserved by &copy;WeGo</p>
  </div>
</template>

<script>
export default {
  name: "Footer"
};
</script>

<style scoped>
p{
    line-height: 25px;
    color: black;
}

body {
    height: 100vh;
}

.site {
    min-height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

h2,h3{
    color: #fff;
}

h2{
    font-size: 18px;
}

.footer-top{
    background-color: #D3D3D3;
    padding: 80px 0px;
}

.segment-two h2{
    color: MAROON;
    font-family: Poppins;
    text-transform: uppercase;
}

.segment-two h2:before{
    content: '|';
    color: MAROON;
    padding-right: 10px;
}

.segment-two ul{
    margin: 0;
    padding: 0;
    list-style: none;
}

.segment-two ul li{
    border-bottom:  1px solid #c2c0c0;
    line-height: 40px;
}

.segment-two ul li a{
    color: #404040;
    text-decoration: none;
}

.segment-three h2{
    color: MAROON;
    font-family: Poppins;
    text-transform: uppercase;
}

.segment-three h2:before{
    content: '|';
    color: MAROON;;
    padding-right: 10px;
}

.segment-three a{
    background: black;
    width: 40px;
    height: 40px;
    display: inline-block;
    margin-left: 35px;
    border-radius: 50%
}

.segment-three a i{
    font-size: 20px;
    color: white;
    padding: 10px 12px;
}

.segment-four h2{
    color: MAROON;
    font-family: Poppins;
    text-transform: uppercase;
}

.segment-four h2:before{
    content: '|';
    color: MAROON;
    padding-right: 10px;
}

.segment-four form input[type=submit]{
    background: rgb(40,167,69);
    border: none;
    padding: 3px 15px;
    margin-left: -4px;
    color: #fff;
    text-transform: uppercase;
}

.footer-bottom-text{
    text-align: center;
    background: #000;
    color: white;
    line-height: 75px;
}

.footer-bottom-text{
    margin-bottom: 0;
}

/* responsive css */
@media only screen and (min-width: 768px) and (max-width: 991px){
    .md-mb-30{
        margin-bottom: 30px;
    }
}
@media only screen and (max-width: 768px){
    .sm-mb-30{
        margin-bottom: 30px;
    }
    .footer-top{
        padding: 50px 0;
    }
}
</style>