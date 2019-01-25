<template>
  <div class="element">
        <div class="logo-con">
            <div class="img-wrapper">
                <img :src="element.imgurl"  @click="jumpTo(element.website)">
                {{element.imgurl}}
            </div>
        </div>
        <div class="content-wrapper">
            <p class="title"  @click="jumpTo(element.website)">
                {{element.title}}
            </p>
            <p class="desc">
                {{element.desc}}
            </p>
            <p class="img-group">
               <img src="./github.png" title="github" class="github-img" @click="jumpTo(element.github)" v-show="element.github"> 
            </p>
        </div>
  </div>
</template>

<script>
export default {
  props: {
    element: {
    }
  },
  data: () => ({}),
  methods: {
      jumpTo(url) {
          window.open(url);
      }
  }
};
</script>

<style lang="stylus" scoped>
    .element
        float left
        width 100%
        height 100px
        border-radius 5px
        background #ffffff
        margin 0 15px 15px 0px
        .logo-con
            display inline-block
            height 100%
            width 100px
            .img-wrapper
                display inline-block
                height 66px
                width 66px
                position relative
                top 12px
                left 15px
                border-radius 5px
                border 1px solid #ccc
                overflow hidden
                text-align center
                cursor pointer
                img 
                    width 100%
                    height 100%

        .content-wrapper
            height calc(100% - 18px)
            float right
            position relative
            display inline-block
            width calc(100% - 100px)
            padding-top 15px
            overflow hidden
            p
                margin 0
                padding 0
            .title
                color blue
                white-space nowrap;
                cursor pointer
            .desc
                font-size 14px
                color #aaaaaa
                margin-top 5px
            .img-group
                position absolute
                text-align right 
                bottom 0
                right 1em
                .github-img
                    height 18px
                    cursor pointer
            

</style>

