package org.test.tictactoe

class Player {
	String screenName
	Integer wins
	Integer losts
	

    static constraints = {
		screenName blank: false
    }
}
