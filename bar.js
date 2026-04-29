class Load {
    draw()/*: void*/ {
        this.progress = this.progress + 0.01 // add value
        let width = ig.system.width * 0.6
        const y = ig.system.height * 0.5 - 4
        const x = ig.system.width * 0.5 - width / 2
        ig.system.context.fillStyle = '#000'
        ig.system.context.fillRect(0, 0, ig.system.contextWidth, ig.system.contextHeight)
        this._drawBar(x, y, width, 8, this.progress)
        ig.Timer.step()
        if (this.endTimer > 0) {
            this.endTimer = this.endTimer - this.timer.tick()
            this.endTimer <= 0 && this.finalize()
        }
    }
    _drawBar(x, y, width, height, progress) {
        ig.system.context.fillStyle = '#56607b'
        ig.system.context.fillRect(x, y, width, height)
        ig.system.context.fillStyle = '#000'
        ig.system.context.fillRect(x + 1, y + 1, width - 2, height - 2)
        ig.system.context.fillStyle = '#aaf'
        ig.system.context.fillRect(x + 2, y + 2, (width - 4) * progress, height - 4)
    }
}
