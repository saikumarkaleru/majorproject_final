import React from 'react'
import { Container, Row, Col } from 'react-bootstrap'

const Footer = () => {
	return (
		<footer>
			<Container>
				<Row>
					<Col className='text-center py-3'>
						
						<a
							rel='noopener noreferrer'
							href='https://github.com/'
							target='_blank'
							className='melvin-kisten'
						>
							<i className='fas fa-user-circle'></i>  Github
						</a>
						Copyright &copy; E-Commerce sai javvaji p
					</Col>
				</Row>
			</Container>
		</footer>
	)
}

export default Footer
