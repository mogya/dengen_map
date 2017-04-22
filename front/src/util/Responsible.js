export default class Responsible {
  constructor(){
    this.xs = false;
    this.sm = false;
    this.md = false;
    this.lg = false;
    if (screen.width >= 1200){
      this.lg = true;
    }
    if (screen.width >= 992){
      this.md = true;
    }
    if (screen.width >= 768){
      this.sm = true;
    }else{
      this.xs = true;
    }
  }
}
