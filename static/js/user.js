// Add to Cart Functionality
document.addEventListener('DOMContentLoaded', function() {
    const addToCartButtons = document.querySelectorAll('.add-to-cart-btn');
    const messageDiv = document.getElementById('message');

    addToCartButtons.forEach(button => {
        button.addEventListener('click', async function() {
            const foodId = this.getAttribute('data-food-id');
            const originalText = this.textContent;
            
            // Disable button and show loading
            this.disabled = true;
            this.textContent = 'Adding...';

            try {
                const formData = new FormData();
                formData.append('food_id', foodId);

                const response = await fetch('/add_to_cart', {
                    method: 'POST',
                    body: formData
                });

                const data = await response.json();

                if (data.success) {
                    // Show success message
                    showMessage('Item added to cart!', 'success');
                    
                    // Change button text temporarily
                    this.textContent = '✓ Added';
                    this.style.background = '#28a745';
                    
                    // Reset button after 2 seconds
                    setTimeout(() => {
                        this.textContent = originalText;
                        this.style.background = '';
                        this.disabled = false;
                    }, 2000);
                } else {
                    showMessage('Failed to add item: ' + data.message, 'error');
                    this.textContent = originalText;
                    this.disabled = false;
                }
            } catch (error) {
                showMessage('Error adding to cart', 'error');
                this.textContent = originalText;
                this.disabled = false;
            }
        });
    });

    function showMessage(message, type) {
        if (messageDiv) {
            messageDiv.textContent = message;
            messageDiv.className = type === 'success' ? 'alert alert-success' : 'alert alert-error';
            messageDiv.style.display = 'block';
            
            setTimeout(() => {
                messageDiv.style.display = 'none';
            }, 3000);
        }
    }
});

// Smooth scroll to top
function scrollToTop() {
    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });
}

// Filter menu by category (if implemented)
function filterByCategory(category) {
    const foodCards = document.querySelectorAll('.food-card');
    
    foodCards.forEach(card => {
        const cardCategory = card.querySelector('.category-badge').textContent;
        
        if (category === 'all' || cardCategory === category) {
            card.style.display = 'block';
        } else {
            card.style.display = 'none';
        }
    });
}