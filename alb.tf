resource "aws_lb" "demo_alb" {
  name               = "demo-alb-tf"
  internal           = false
  vpc_id             = aws_vpc.demo_vpc.id
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [aws_subnet.pub_sub_1.id, aws_subnet.pub_sub_2.id]

  enable_deletion_protection = true

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_target_group" "target_group" {
    name = "target_group"
    vpc_id = aws_vpc.demo_vpc.id
    port = 80
    protocol = "tcp"
    
    health_check {
      healthy_threshold = 3
      unhealthy_threshold = 2
      timeout = 4
      interval = 5
    }
    

}

resource "aws_lb_target_group_attachment" "tg_attachment_1" {
    target_group_arn = aws_lb_target_group.target_group.arn
    target_id = aws_instance.webserver.id

  
}

resource "aws_lb_target_group_attachment" "tg_attachment_2" {
    target_group_arn = aws_lb_target_group.target_group.arn
    target_id = aws_instance.database.id


  
}

resource "aws_lb_listener" "demo_listner" {
    load_balancer_arn = aws_lb.demo_alb.arn
    port = 80
    protocol = "HTTP"

}