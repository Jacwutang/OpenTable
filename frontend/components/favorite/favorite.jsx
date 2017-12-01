import React from 'react';

class Favorite extends React.Component{
  constructor(props){
    super(props);
    this.handleSubmit = this.handleSubmit.bind(this);

  }

  componentWillMount(){
    this.props.clearErrors();
  }

  handleSubmit(){

    let favorite = {};

    if(this.props.currentUser){
      favorite.user_id = this.props.currentUser.id;
      favorite.restaurant_id = this.props.match.params.restId;
      debugger;
    }




    this.props.createFavorite(favorite).then(() => this.props.history.push('/profile'));
  }

  render(){

    return(
      <button onClick={this.handleSubmit} type="button" className = "fav-button-restaurant-item"> <i className="fa fa-star" aria-hidden="true"></i> Fav </button>
    );
  }


}

export default Favorite;
