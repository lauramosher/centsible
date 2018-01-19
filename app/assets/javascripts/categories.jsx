class Categories extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      categories: props.categories,
      nameError: null,
      budgetError: null
    };
    this.handleAddCategory = this.handleAddCategory.bind(this);
    this.handleRemoveCategory = this.handleRemoveCategory.bind(this);
  }

  updateState(category, method) {
    // TODO REFACTOR ME
    if (category['category']) {
      var categories = this.state.categories.slice();
      if (method === "post") {
        categories.push(category['category']);

        document.querySelector("form#addCategoryForm").reset();
        document.querySelector("form#addCategoryForm span").innerHTML = "";
        document.querySelector("#addCategoryForm input:first-child").focus();
      } else {
        categories = categories.filter(cat => { return cat.name !==  category['category']['name'] })
      }
      this.setState({categories: categories});
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
    .then(data => { this.updateState(data, 'post'); })
  }

  handleRemoveCategory(event) {
    var categoryId = event.target.dataset["categoryId"];
    fetch(`/categories/${categoryId}`, {
      method: "DELETE"
    })
    .then(response => { return response.json(); })
    .then(data => { this.updateState(data, 'delete'); })
  }

  render() {
    return (
      <section>
        <CategoriesTable
          categories={this.state.categories}
          handleRemove={this.handleRemoveCategory} />
        <NewCategoryForm
          handler={this.handleAddCategory}
          nameError={this.state.nameError}
          budgetError={this.state.budgetError} />
      </section>
    )
  }
}
