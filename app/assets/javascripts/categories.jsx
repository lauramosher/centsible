class Categories extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      categories: props.categories,
      nameError: null,
      budgetError: null
    };
    this.handleAddCategory = this.handleAddCategory.bind(this);
  }

  updateState(category) {
    if (category['category']) {
      var categories = this.state.categories.slice();
      categories.push(category['category']);
      this.setState({categories: categories});

      document.querySelector("form#addCategoryForm").reset();
      document.querySelector("form#addCategoryForm span").innerHTML = "";
      document.querySelector("#addCategoryForm input:first-child").focus();
    } else {
      var messages = category['messages'];
      this.setState({nameError: messages['name'], budgetError: messages['budget']});
    }
  }

  handleAddCategory(event) {
    event.preventDefault();
    var data = {};
    var formData = new FormData(event.target);

    formData.forEach(function(value, key) {
      data[key] = value;
    });

    fetch(this.props.addUrl, {
      method: "POST",
      body: JSON.stringify(data),
      headers: new Headers({
        'Content-Type': 'application/json'
      })
    })
    .then(response => { return response.json(); })
    .then(data => { this.updateState(data); })
  }

  render() {
    return (
      <section>
        <CategoriesTable
          categories={this.state.categories} />
        <NewCategoryForm
          handler={this.handleAddCategory}
          nameError={this.state.nameError}
          budgetError={this.state.budgetError} />
      </section>
    )
  }
}
