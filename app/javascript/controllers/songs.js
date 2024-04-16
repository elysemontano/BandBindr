import { Songs } from "@hotwired/stimulus";

export default class Songs extends Controller {
  static targets = ["input"];

  connect() {
    // Event listener for input event on the search input
    this.inputTarget.addEventListener("input", this.search.bind(this));
  }

  search() {
    // Get the current query from the input element
    const query = this.inputTarget.value.trim();
    console.log(query)
    // Get the organization ID from a data attribute
    const organizationId = this.element.dataset.organizationId;
    // Construct the URL for the AJAX request
    const url = `/organization/${organizationId}/songs?q=${encodeURIComponent(query)}`;
    // Make the AJAX request
    Rails.ajax({
      type: "GET",
      url: url,
      success: (data) => {
        // Update the songs container with the search results
        const songsContainer = document.getElementById("songs-container");
        songsContainer.innerHTML = data;
      },
      error: (error) => {
        console.error("Live search error:", error);
      },
    });
  }
}
