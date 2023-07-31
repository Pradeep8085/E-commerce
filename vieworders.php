<?php
session_start();

require 'dbcon.php';

if(is_null($_SESSION['USER_ID'])){
    header("Location: /login.php");
}

$query = "SELECT * FROM order_items join product on product.pid = order_items.pid WHERE uid = {$_SESSION['USER_ID']}";
$result = $conn->query($query);

?>
<!--
author: W3layouts
author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/

<!DOCTYPE html>
<html>

<head>
    <title>My Orders | Grocery Store</title>

    <?php
    include 'header.php' ?>
    <form action="checkout.php" method="post">
        <div class="w3l_banner_nav_right">
            <!-- about -->
<div class="privacy about">
    <h3>My <span>Orders</span></h3>
    <div class="checkout-right">

        <table class="timetable_sub">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Product</th>
                    <th>Name</th>
                    <th>Rate</th>
                    <th>Quality</th>
                    <th>Price</th>
                    <th>Cancle</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $i = 0;
                while ($row = $result->fetch_assoc()) {
                    $pid = $row['pid'];
                    $image = $row['pic'];
                    $amount = $row['amount'];
                    $subtotal = $row['amount'] * $row['quantity'];
                    $total += $subtotal;
                    $i++;
                ?>
                    <tr class="rem<?= $i ?>">
                        <td class="invert">
                            <?= $i ?>
                        </td>

                        <td class="invert-image">
                            <a href="single.php">
                                <img src="<?= $image ?>" alt="<?= $row['name'] ?>" class="img-responsive">
                            </a>
                        </td>

                        <td class="invert">
                            <span id="name_<?= $pid ?>">
                                <?= ucwords($row['name']) ?>
                            </span>
                        </td>
                        <input type="hidden" name="name_<?= $pid ?>" value="<?= $row['name'] ?>">

                        <td class="invert">
                            <span id="amount_<?= $pid ?>"><?= $row['amount'] ?></span>
                        </td>
                        <input type="hidden" name="amount_<?= $pid ?>" value="<?= $row['amount'] ?>">

                        <td class="invert">
                            <div class="quantity">
                                <div class="quantity-select">
                                    <span><?= $row['quantity'] ?></span>
                                </div>
                            </div>
                        </td>
                        <input type="hidden" name="quantity_<?= $pid ?>" value="<?= $row['quantity'] ?>">

                        <td class="invert">
                            <span id="subtotal_<?= $pid ?>"><?= $subtotal ?></span>
                        </td>
                        <input type="hidden" name="subtotal_<?= $pid ?>" value="<?= $subtotal ?>">
                        <input type="hidden" name="item_id" value="<?= $row['item_id'] ?>">

                        <td class="invert">
                            <div class="rem" id="<?= $i ?>">
                                <div class="close1"></div>
                            </div>
                        </td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>


    </div>

</div>
<!-- //about -->
</div>
</form>
<div class="clearfix"></div>
</div>
<!-- //banner -->

<!--quantity-->
<script>
    $(document).ready(function(e) {
        let ajaxRequest = (id) => {
            $.post("cancleOrder.php", {
                    id: id,
                },
                function(data, status) {
                });
        }

        $('.rem').on('click', function(c) {
            id = $(this).attr("id");
            order_id = c.target.parentElement.parentElement.parentElement.querySelector("input[name='item_id']").value
            ajaxRequest(order_id)
            $('.rem' + (+id)).fadeOut('slow', function(e) {
                element.remove();
            });
        });
    });
</script>

<?php include 'footer.php' ?>


</body>

</html>