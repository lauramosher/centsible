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

  handleAddCategoryResponse(data) {
    if (data['category']) {
      var categories = this.state.categories.slice();
      categories.push(data['category']);

      this.setState({
        categories: categories,
        nameError: null,
        budgetError: null
      });

      resetForm("form#addCategoryForm");
    } else {
      var messages = data['messages'];
      this.setState({
        nameError: messages['name'],
        budgetError: messages['budget']
      });
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
    .then(data => { this.handleAddCategoryResponse(data); })
  }

  handleRemoveCategoryResponse(data) {
    var categories = this.state.categories.slice();
    categories = categories.filter(c => c.name !==  data['category']['name']);
    this.setState({
      categories: categories,
      nameError: null,
      budgetError: null
    });
  }

  handleRemoveCategory(event) {
    var categoryId = event.target.dataset["categoryId"];
    fetch(`/categories/${categoryId}`, {
      method: "DELETE"
    })
    .then(response => { return response.json(); })
    .then(data => { this.handleRemoveCategoryResponse(data); })
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
