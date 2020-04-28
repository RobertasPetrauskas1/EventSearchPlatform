<template>
<div>
    <a href="/#login" @click.prevent="show">Log in</a>
    <modal name="modal-login">
        hello, world!
    </modal>
</div>
</template>

<script>
export default {
    method: {
        show () {
            this.$modal.show('modal-login');
        },
        hide() {
            this.$modal.hide('modal-login');
        }
    }
}
</script>