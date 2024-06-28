<div>
    <button id="deleteAccountBtn" class="btn btn-danger">Delete Account</button>

    <!-- Modal -->
    <div class="modal fade" id="deleteAccountModal" tabindex="-1" role="dialog" aria-labelledby="deleteAccountModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteAccountModalLabel">Confirm Delete Account</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Are you sure you want to delete your account?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                    <button type="button" class="btn btn-danger" id="confirmDeleteBtn">Yes</button>
                </div>
            </div>
        </div>
    </div>
</div>

<?php echo '<script'; ?>
 src="https://code.jquery.com/jquery-3.6.0.min.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
>
    $(document).ready(function() {
        $('#deleteAccountBtn').click(function () {
            $('#deleteAccountModal').modal('show');
        });

        $('#confirmDeleteBtn').click(function () {
            const userId = localStorage.getItem('userID');
            const url = `http://34.227.203.225:8003/user/${userId}`;

            fetch(url, {
                method: 'DELETE',
            }).then(response => {
                if (response.ok) {
                    // Clear local storage
                    localStorage.clear();
                    // Destroy session
                    // Assuming this is handled by the backend session management, for example by setting a cookie with zero expiry
                    document.cookie = 'session=; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/;';
                    // Redirect to home page or login page
                    window.location.href = '/login';
                } else {
                    alert('Failed to delete account. Please try again.');
                }
            }).catch(error => {
                console.error('Error:', error);
            });

            $('#deleteAccountModal').modal('hide');
        });
    });
<?php echo '</script'; ?>
>
